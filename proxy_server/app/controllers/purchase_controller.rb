class PurchaseController < ApplicationController
  def create
    Purchases::Creator.new(user: current_user, product: product).call

    render json: { msg: 'processing, wait a moment' }, status: :processing
  end

  private

  def product
    @product ||= Product.find(params[:product_id])
  end
end
