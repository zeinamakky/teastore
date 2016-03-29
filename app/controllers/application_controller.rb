class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_carted_teas

  def get_carted_teas
    @carted_teas = 0
    #CartedTea.where(status: "carted", user_id: current_user.id)
    #@cart_count = @carted_teas.count

  end
end
