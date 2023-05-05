class RabbitmqClient::Listner
  def perform
    channel.queue('checkout_to_proxy').subscribe(manual_ack: false, block: true) do |_, _, payload|
      p 'Servidor Proxy: Recebi a confirmação do servidor de checkout pela fila "checkout_to_proxy" com a mensagem: '
      p JSON.parse(payload)
    end
  end

  private

  def channel
    @channel ||= RabbitmqClient::Connection.new.start.create_channel
  end
end
