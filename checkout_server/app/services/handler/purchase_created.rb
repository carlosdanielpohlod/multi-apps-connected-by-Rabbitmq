class Handler::PurchaseCreated
  def initialize(payload:)
    @payload = payload
  end

  def perform!
    product = Product.find_by(external_reference_id: @payload['product_id'])
    p @payload
    Purchase.create(
      external_user_id: @payload['user_id'],
      product_id: product.id,
      status: :pending
    )
  end
end
