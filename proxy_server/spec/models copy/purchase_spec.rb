require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '.create' do
    let(:notifier) do
      instance_double(RabbitmqClient::Notifier::Purchase, call: true)
    end
    let(:user) { FactoryBot.create :user }
    let(:product) { FactoryBot.create :product }

    setup do
      allow(RabbitmqClient::Notifier::Purchase)
        .to receive(:new)
        .and_return(notifier)
    end

    it 'calls RabbitMq notifier with self after creation' do
      created = described_class.create(user: user, product: product)

      expect(RabbitmqClient::Notifier::Purchase)
        .to have_received(:new)
        .with(purchase: created)
    end
  end
end
