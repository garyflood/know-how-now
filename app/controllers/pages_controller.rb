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

  # Full list of recently added devices (linked from Explore \"View all\")
  def explore_recent_devices
    @recent_devices = Device.joins(:video)
                            .includes(:video, :category)
                            .order("videos.created_at DESC")
                            .distinct
  end
end
