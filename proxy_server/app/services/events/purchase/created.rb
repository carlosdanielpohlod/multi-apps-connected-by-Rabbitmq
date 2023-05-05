class Events::Purchase::Created
  def initialize(purchase:)
    @purchase = purchase
  end

  def payload
    @payload ||= {
      subject: 'purchase_created',
      product_id: @purchase[:product_id],
      user_id: @purchase[:user_id]
    }
  end
end
