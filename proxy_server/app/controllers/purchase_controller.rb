class PurchaseController < ApplicationController
  def create
    Purchase.create(user: user, product: product)

    render json: { msg: 'processing, wait a moment' }, status: :processing
  end

  private

  def product
    @product ||= Product.find(params[:product_id])
  end
end
