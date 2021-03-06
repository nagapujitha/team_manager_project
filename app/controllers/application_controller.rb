class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #!--- Added by AlvaroD ----#
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
