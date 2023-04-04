class RabbitmqClient::Listner < RabbitmqClient::Connection
  def perform
    puts "Consuming messages"

    queue.subscribe(manual_ack: false, block: true) do |_, _, payload|
      puts "📢 Received '#{payload}'"
    end
  end
end
