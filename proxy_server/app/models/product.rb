class Product < ApplicationRecord
  include Notifiable
  
  validate :name, :price, :description, :color

  after_update do
    event = Events::Product::Updated.new(product: self)

    notify(event)
  end

  after_create do
    event = Events::Product::Created.new(product: self)

    notify(event)
  end
end
