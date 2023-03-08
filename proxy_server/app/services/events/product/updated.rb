class Events::Product::Updated
  def initialize(product:)
    @product = product
  end

  def payload
    @payload ||= {
      subject: 'product_updated',
      price: @product.price,
      name: @product.name,
      product_id: @product.id
    }
  end
end
