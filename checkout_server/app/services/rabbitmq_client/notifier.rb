class RabbitmqClient::Notifier < RabbitmqClient::BaseClient
  def initialize(event:)
    @event = event
  end

  def call
    'not implemented yet'
  end
end
