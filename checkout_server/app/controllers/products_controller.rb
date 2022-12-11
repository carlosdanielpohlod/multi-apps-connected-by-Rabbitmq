class ProductsController < ApplicationController
  def create
    Product.create(
      price: params[:price],
      name: params[:name],
      external_reference_id: params[:id]
    )

    head(:created)
  end
end
