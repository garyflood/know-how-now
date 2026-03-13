class BookmarksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def index
    @bookmarks = current_user.bookmarks.includes(device: :category).order(created_at: :desc)
  end

  def create
    device = Device.find_by(id: params[:device_id])
    unless device
      redirect_back fallback_location: root_path, alert: "Device not found." and return
    end

    if user_signed_in?
      bookmark = current_user.bookmarks.find_or_initialize_by(device: device)

      if bookmark.persisted? || bookmark.save
        redirect_back fallback_location: manual_device_path(device), notice: "Device saved to your profile."
      else
        redirect_back fallback_location: manual_device_path(device), alert: "Could not save bookmark: #{bookmark.errors.full_messages.to_sentence}"
      end
    else
      session[:pending_bookmark_device_id] = device.id
      redirect_to new_user_registration_path
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    device = bookmark.device
    bookmark.destroy
    redirect_back fallback_location: bookmarks_path, notice: "Removed from saved manuals."
  end
end

