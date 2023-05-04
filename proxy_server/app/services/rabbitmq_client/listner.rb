class RabbitmqClient::Listner
  def perform
    channel.queue('checkout_to_proxy').subscribe(manual_ack: false, block: true) do |_, _, payload|
      p 'Servidor Proxy: Recebi a confirmação do servidor de checkout com a mensagem: '
      p payload
    end
  end

  private

  def channel
    @channel ||= RabbitmqClient::Connection.new.start.create_channel
  end
end
