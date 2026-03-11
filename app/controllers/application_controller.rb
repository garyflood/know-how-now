class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    profile_path
  end

  def after_sign_up_path_for(_resource)
    profile_path
  end

  private

  # Allow extra fields on Devise sign up (full_name, username)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :username, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :username, :photo])
  end
end
