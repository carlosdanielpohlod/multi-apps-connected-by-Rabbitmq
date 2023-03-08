class RabbitMq::Client::Listner < RabbitMq::Client::Base
  def perform
    puts "Consuming messages"

    queue.subscribe(manual_ack: false, block: true) do |_, _, payload|
      puts "📢 Received '#{payload}'"
    end
  end
end
