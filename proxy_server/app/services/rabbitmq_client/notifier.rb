class RabbitmqClient::Notifier
  def initialize(event:)
    @event = event
  end

  def call
    p "servidor proxy_server (Produtor): enviando evento pela fila proxy_to_checkout: "
    p JSON.parse(@event.payload.to_json)

    channel.queue('proxy_to_checkout').publish(
      @event.payload.to_json,
      routing_key: ENV['DEFAULT_ROUTING_KEY']
    )
  end

  private

  def channel
    @channel ||= RabbitmqClient::Connection.new.start.create_channel
  end
end
