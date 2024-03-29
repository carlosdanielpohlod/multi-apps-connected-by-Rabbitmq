class RabbitmqClient::Notifier
  def initialize(event:)
    @event = event
  end

  def call
    channel.queue('checkout_to_proxy').publish(
      @event.payload.to_json,
      routing_key: ENV['DEFAULT_ROUTING_KEY']
    )
  end

  private

  def channel
    @channel ||= RabbitmqClient::Connection.new.start.channel
  end
end
