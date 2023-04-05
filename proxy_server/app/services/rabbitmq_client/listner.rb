class RabbitmqClient::Listner
  def perform
    puts "Consuming messages"

    channel.queue('checkout_to_proxy').subscribe(manual_ack: false, block: true) do |_, _, payload|
      puts "📢 Received '#{payload}'"
    end
  end

  private

  def channel
    @channel ||= RabbitmqClient::Connection.new.start.channel
  end
end