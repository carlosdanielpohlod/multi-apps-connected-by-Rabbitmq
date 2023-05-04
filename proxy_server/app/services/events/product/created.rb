class Events::Product::Created
  def initialize(product:)
    @product = product
  end

  def payload
    @payload ||= {
      subject: 'product_created',
      price: @product.price,
      name: @product.name,
      external_reference_id: @product.id
    }
  end
end
