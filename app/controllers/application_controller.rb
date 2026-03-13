class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    handle_pending_bookmark(resource) || profile_path
  end

  def after_sign_up_path_for(resource)
    handle_pending_bookmark(resource) || profile_path
  end

  private

  def handle_pending_bookmark(user)
    device_id = session.delete(:pending_bookmark_device_id)
    return nil if device_id.blank?

    device = Device.find_by(id: device_id)
    return nil unless device

    user.bookmarks.find_or_create_by(device: device)
    manual_device_path(device)
  end

  # Allow extra fields on Devise sign up (full_name, username)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :username, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :username, :photo])
  end
end
