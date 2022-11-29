require 'rails_helper'

RSpec.describe Purchases::Creator, type: :service do
  describe '.call' do
    let(:user) { FactoryBot.create :user }
    let(:product) { FactoryBot.create :product }
    let(:notifier) do
      instance_double(RabbitmqClient::Notifier::Purchase, call: true)
    end

    subject { described_class.new(user: user, product: product) }

    setup do
      allow(Purchase).to receive(:create)

      allow(RabbitmqClient::Notifier::Purchase)
        .to receive(:new)
        .and_return(notifier)
    end

    it 'calls Purchase.create with correct params' do
      expect(Purchase)
        .to receive(:create)
        .with(user: user, product: product)

      subject.call
    end
  end
end
