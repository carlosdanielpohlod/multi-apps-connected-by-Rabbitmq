class Purchase < ApplicationRecord
  extend Enumerize
  belongs_to :product

  enumerize :status,
            in: %i[pending success fail],
            default: :pending

  after_update do
    event = Events::Purchase::StatusChanged.new(purchase_id: self.id)

    RabbitmqClient::Notifier.new(event: event).call
  end
end
