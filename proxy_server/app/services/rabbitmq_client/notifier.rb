class RabbitmqClient::Notifier
  def initialize(event:)
    @event = event
  end

  def call
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
