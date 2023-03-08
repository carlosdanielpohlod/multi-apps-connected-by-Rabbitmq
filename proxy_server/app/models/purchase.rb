class Purchase < ApplicationRecord
  include Notifiable
  
  belongs_to :user
  belongs_to :product

  after_create do
    RabbitmqClient::Notifier::Purchase.new(purchase: self).call
  end
end
