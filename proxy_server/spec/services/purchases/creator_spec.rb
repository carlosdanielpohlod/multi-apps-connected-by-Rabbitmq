require 'rails_helper'

RSpec.describe Purchases::Creator, type: :service do
  describe '.call' do
    let(:user) { FactoryBot.create :user }
    let(:product) { FactoryBot.create :product }
    let(:purchase) { FactoryBot.create :purchase }
    let(:notifier) do
      instance_double(RabbitmqClient::Notifier::Purchase, call: true)
    end

    subject { described_class.new(user: user, product: product) }

    setup do
      allow(Purchase)
        .to receive(:create)
        .and_return(purchase)

      allow(RabbitmqClient::Notifier::Purchase)
        .to receive(:new)
        .and_return(notifier)
    end

    it 'calls Purchase.create with correct params' do
      subject.call

      expect(Purchase)
        .to have_received(:create)
        .with(user: user, product: product)
    end

    it 'calls notifier with created purchase' do
      subject.call

      expect(RabbitmqClient::Notifier::Purchase)
        .to have_received(:new)
        .with(purchase: purchase)

      expect(notifier)
        .to have_received(:call)
    end
  end
end
