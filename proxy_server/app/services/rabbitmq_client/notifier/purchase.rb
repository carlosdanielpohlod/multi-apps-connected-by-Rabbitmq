class RabbitmqClient::Notifier::Purchase < RabbitmqClient::BaseClient

  def initialize(purchase:)
    @purchase = purchase
  end

  def call
    'not implemented yet'
  end
end
