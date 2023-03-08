require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  
  setup do
    allow(RabbitmqClient::Notifier)
      .to receive(:call)
  end

  describe 'POST create' do
    let(:product) { FactoryBot.create :product }

    setup do
      allow(Purchase)
        .to receive(:create)
    end

    context 'when authenticated' do
      let(:params) do
        {
          product_id: product.id,
          external_user_id: rand,
          authenticated: true
        }
      end

      it 'calls Purchase.create with correct params' do
        post :create, params: params

        expect(Purchase)
          .to have_received(:create)
          .with(
            product_id: params[:product_id].to_s,
            external_user_id: params[:external_user_id].to_s
          )
      end

      it 'returns success status' do
        post :create, params: params

        expect(response).to have_http_status(201)
      end
    end

    context 'when unauthenticated' do
      let(:params) do
        {
          authenticated: false
        }
      end

      it 'returns unauthorized' do
        post :create, params: params

        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'GET show' do
    let(:purchase) { FactoryBot.build :purchase }

    setup do
      allow(Purchase)
        .to receive(:find)
        .and_return(purchase)
    end

    context 'when authenticated' do
      let(:params) do
        {
          authenticated: true,
          id: 1
        }
      end

      it 'calls Purchase.find with correct params' do
        get :show, params: params

        expect(Purchase)
          .to have_received(:find)
          .with(params[:id].to_s)
      end

      it 'returns success payload' do
        get :show, params: params

        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)).to eq(purchase.attributes)
      end
    end
  end
end
