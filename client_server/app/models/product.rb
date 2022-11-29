class Product < ApplicationRecord
  validate :name, :price, :description, :color
end
