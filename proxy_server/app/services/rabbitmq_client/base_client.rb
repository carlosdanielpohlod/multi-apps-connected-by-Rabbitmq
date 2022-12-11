class RabbitmqClient::BaseClient
  attr_reader :queue, :channel

  def initialize
    @channel = connection.channel
    @queue = @channel.queue(ENV['DEFAULT_ROUTING_KEY'], durable: true)
  end

  private

  def connection
    @connection ||= RabbitmqClient::Connection.new.start
  end
end
