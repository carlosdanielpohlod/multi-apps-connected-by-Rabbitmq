module Notifiable
  extend ActiveSupport::Concern

  def notify(event)
    RabbitmqClient::Notifier.new(event: event).call
  end
end
