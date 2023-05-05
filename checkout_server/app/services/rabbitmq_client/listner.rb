class RabbitmqClient::Listner
  def perform
    puts "Servidor checkout (Consumidor): Recebido mensagem pela fila proxy_to_checkout"

    channel.queue('proxy_to_checkout').subscribe(manual_ack: false, block: true) do |_, _, payload|
      payload = JSON.parse(payload)

      case payload['subject']
      when 'product_created'
        Handler::ProductCreated.new(payload: payload).perform!
      when 'purchase_created'
        Handler::PurchaseCreated.new(payload: payload).perform!
      end
    end
  end

  private

  def channel
    @channel ||= RabbitmqClient::Connection.new.start.create_channel
  end
end
