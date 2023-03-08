require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product) } # criar um produto usando o FactoryBot

  describe 'after_update' do
    it 'calls notify method with updated event' do
      event = instance_double(Events::Product::Updated, product: product)
      expect(RabbitmqClient::Notifier).to receive(:new).with(event: event).and_return(double(call: true))

      product.update(name: 'New Name')

      expect(product.errors).to be_empty
    end
  end

  describe 'after_create' do
    it 'calls notify method with created event' do
      event = instance_double(Events::Product::Created, product: product)
      expect(RabbitmqClient::Notifier).to receive(:new).with(event: event).and_return(double(call: true))

      new_product = Product.create(name: 'New Product', price: 9.99, description: 'New description', color: 'red')

      expect(new_product.errors).to be_empty
    end
  end
end
