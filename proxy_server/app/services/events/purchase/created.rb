class Events::Purchase::Created
  def initialize(purchase:)
    @purchase = purchase
  end

  def payload
    @payload ||= {
      subject: 'purchase_created',
      product_id: params[:product_id],
      user_id: params[:user_id]
    }
  end
end
