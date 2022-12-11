require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'POST create' do
    let(:params) do
      {
        name: 'sample',
        price: '10.0',
        id: '1'
      }
    end

    setup do
      allow(Product)
        .to receive(:create)
    end

    it 'calls Product.create with correct params' do
      post :create, params: params

      expect(Product)
        .to have_received(:create)
        .with(
          price: params[:price],
          name: params[:name],
          external_reference_id: params[:id]
        )
    end

    it 'returns success status' do
      post :create, params: params

      expect(response.status).to eq(201)
    end
  end
end
