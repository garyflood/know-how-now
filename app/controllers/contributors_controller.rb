class ContributorsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @contributor = User.find(params[:id])
    @tab = params[:tab] == "most_popular" ? "most_popular" : "all"

    @videos = if @tab == "most_popular"
      @contributor.videos.order(views: :desc)
    else
      @contributor.videos.order(created_at: :desc)
    end

    @total_views = @contributor.videos.sum(:views)
  end
end
