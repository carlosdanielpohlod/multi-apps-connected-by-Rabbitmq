class ProductsController < ApplicationController
  def create
    Product.create(
      price: params[:price],
      name: params[:name],
      external_reference_id: params[:id]
    )
    
    created_event = Events::Product::Created.new(product_id: product_id)
    notify(created_event)
  end
end
