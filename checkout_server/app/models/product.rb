class Product < ApplicationRecord
  validates :name, presence: true
  # representation of product_id from proxy_server
  validates :external_reference_id, uniqueness: true
end
