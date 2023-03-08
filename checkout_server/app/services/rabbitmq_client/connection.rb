class RabbitmqClient::Connection
  attr :connection, :channel

  # hostname: defines the RabbitMQ hostname to be accessed (in our case based on the docker configured)
  # automatically_recover: In cause of fail we try or not to recover

  def initialize
    @connection = Bunny.new(host: 'rabbitmq',
                            port: '5672',
                            vhost: '/',
                            user: 'guest',
                            pass: 'guest')
  end

  def start
    connection.start
  end

  def close
    connection.close
  end

  def channel
    @channel ||= connection.create_channel
  end
end
