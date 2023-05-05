class Purchase < ApplicationRecord
  include Notifiable

  belongs_to :user
  belongs_to :product

  after_create do
    p 'aaa'
    event = Events::Purchase::Created.new(purchase: self)

    notify(event)
  end
end
