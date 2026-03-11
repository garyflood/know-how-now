class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Allow extra fields on Devise sign up (full_name, username)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :username, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :username, :photo])
  end
end
