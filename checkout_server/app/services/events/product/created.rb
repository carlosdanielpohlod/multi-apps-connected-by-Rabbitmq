class Events::Product::Created
  def initialize(product_id:)
    @product_id = product_id
  end

  def payload
    @payload ||= {
      subject: 'product_created',
      product_id: @product_id
    }
  end
end
