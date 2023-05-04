class RabbitmqClient::Listner
  def perform
    puts "Consuming messages"

    channel.queue('proxy_to_checkout').subscribe(manual_ack: false, block: true) do |_, _, payload|
      payload = JSON.parse(payload)
      
      if payload['subject'] == 'product_created'
        Handler::ProductCreated.new(payload: payload).perform!
      end
    end
  end

  private

  def channel
    @channel ||= RabbitmqClient::Connection.new.start.create_channel
  end
end
