class Product < ApplicationRecord
  include Notifiable
  
  validates :name, presence: true
  # representation of product_id from proxy_server
  validates :external_reference_id, uniqueness: true

  after_create do
    created_event = Events::Product::Created.new(product_id: id)
    notify(created_event)
  end
end
