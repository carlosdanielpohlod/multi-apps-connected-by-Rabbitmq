class ApplicationController < ActionController::API
  def verify_authentication
    return head(:unauthorized) unless params[:authenticated] == 'true'
  end
end
