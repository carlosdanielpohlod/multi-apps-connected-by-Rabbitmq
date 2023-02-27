class ApplicationController < ActionController::API
  def verify_authentication
    return head(:unauthorized) unless params[:authenticated] == 'true'
  end

  def notify(event)
    RabbitmqClient::Notifier.new(event: event).call
  end
end
