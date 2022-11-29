require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  let!(:user) { FactoryBot.create :user }

  describe 'POST create' do
    let!(:product) { FactoryBot.create :product }
    let(:params) do
      {
        product_id: product.id
      }
    end
    let(:creator) do
      instance_double(Purchases::Creator, call: true)
    end

    setup do
      allow(Purchases::Creator)
        .to receive(:new)
        .and_return(creator)
    end

    it 'calls Purchases::Creator' do
      expect(Purchases::Creator)
        .to receive(:new)
        .with(user: user, product: product)

      expect(creator).to receive(:call)

      post :create, params: params
    end

    it 'returns success response' do
      post :create, params: params

      expect(response.status).to eq(102)
      expect(JSON.parse(response.body)['msg']).to eq('processing, wait a moment')
    end
  end
end
