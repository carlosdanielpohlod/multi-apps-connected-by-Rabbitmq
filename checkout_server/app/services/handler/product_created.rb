class Handler::ProductCreated
  def initialize(payload:)
    @payload = payload
  end

  def perform!
    p @payload

    Product.create(
      external_reference_id: @payload['external_reference_id'],
      name: @payload['name'],
      price: @payload['price']
    )

    p 'Vou notificar o servidor proxy que criei a minha versão do produto'
  end
end
