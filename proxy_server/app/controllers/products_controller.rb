class ProductsController < ApplicationController
  def create
    Product.create(permitted_params)
    
    render json: { msg: 'processing, wait a moment' }, status: :ok
  end

  private

  def permitted_params
    params.permit(:name, :price, :description, :color)
  end
end
