class PurchasesController < ApplicationController
  before_action :verify_authentication

  def create
    purchase = Purchase.create(
      product_id: params[:product_id],
      status: 'created',
      external_user_id: params[:external_user_id]
    )

    notify(current_status_event(purchase.id))
  end

  def show
    notify(current_status_event(params[:purchase_id]))
  end

  private

  def current_status_event(purchase_id)
    @current_status_event ||= Events::Purchase::CurrentStatus.new(
      purchase_id: purchase_id
    )
  end
end
