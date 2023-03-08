class ProductsController < ApplicationController
  def create
    Product.create(
      price: params[:price],
      name: params[:name],
      product_id: params[:product_id]
    )
  end
end
