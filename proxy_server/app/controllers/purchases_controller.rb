class PurchasesController < ApplicationController
  def create
    user = User.find_or_create_by(id: 1, name: 'default user')
    Purchase.create(user: user, product: product)
 
    render json: { msg: 'processing, wait a moment' }, status: :processing
  end

  private

  def product
    @product ||= Product.find(params[:product_id])
  end
end
