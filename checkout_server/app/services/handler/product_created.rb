class Handler::ProductCreated
  def initialize(params:)
    @params = params
  end

  def perform!
    p 'Servidor de checkout: Recebi um produto do servidor proxy: '
    p @params

    Product.create(
      external_reference_id: @payload['external_reference_id'],
      name: @payload['name'],
      price: @payload['price']
    )

    p 'Vou notificar o servidor proxy que criei a minha versão do produto'
  end
end
