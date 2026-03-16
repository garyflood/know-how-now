class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :explore, :explore_category ]

  def home
  end

  def explore
    # Recently added devices: devices that have a video, newest first
    @recent_devices = Device.joins(:video)
                            .includes(:video, :category)
                            .order("videos.created_at DESC")
                            .distinct
                            .limit(12)

    # Popular guides: videos ordered by views, including their device
    @popular_videos = Video.includes(:device).order(views: :desc).limit(8)
  end

  def explore_category
    @category = Category.find(params[:id])
    @devices = @category.devices.order(:name)
  end

  # Full list of recently added devices (linked from Explore \"View all\")
  def explore_recent_devices
    @recent_devices = Device.joins(:video)
                            .includes(:video, :category)
                            .order("videos.created_at DESC")
                            .distinct
  end

  # Simple search: find a device by name and redirect to its detail page
  def explore_search
    query = params[:q].to_s.strip
    if query.blank?
      redirect_to explore_path and return
    end

    device = Device.find_by(name: query) ||
             Device.where("name ILIKE ?", "%#{query}%").order(:name).first

    if device
      redirect_to device_path(device)
    else
      redirect_to explore_path, alert: "No device found matching \"#{query}\"."
    end
  end
end
