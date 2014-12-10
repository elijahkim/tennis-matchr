class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    super || Guest.new
  end

  def you_naughty_boy
    flash[:notice] = "You can't do that"
    redirect_to root_path
  end
end
