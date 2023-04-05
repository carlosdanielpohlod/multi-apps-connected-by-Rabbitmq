class RabbitmqClient::Listner
  def perform
    puts "Consuming messages"

    channel.queue('proxy_to_checkout').subscribe(manual_ack: false, block: true) do |_, _, payload|
      payload = JSON.parse(payload)
      
      if payload['subject'] == 'product_created'
        Product.create(external_reference_id: payload['product_id'], name: payload['name'], price: payload['price'])
      end
    end
  end

  private

  def channel
    @channel ||= RabbitmqClient::Connection.new.start.channel
  end
end
