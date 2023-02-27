require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'associations' do
  end

  describe 'before_update' do
    let(:notifier) do
      instance_double(RabbitmqClient::Notifier::PurchaseChangedStatus, call: true)
    end
    let!(:purchase) { FactoryBot.create :purchase }

    setup do
      allow(RabbitmqClient::Notifier::PurchaseChangedStatus)
        .to receive(:new)
        .and_return(notifier)
    end

    it 'calls RabbitMq notifier with self after update' do
      purchase.update(status: :success)

      expect(RabbitmqClient::Notifier::PurchaseChangedStatus)
        .to have_received(:new)
        .with(purchase: purchase)

      expect(notifier).to have_received(:call)
    end
  end
end
