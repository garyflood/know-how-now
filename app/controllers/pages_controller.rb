class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :explore, :explore_category ]

  def home
  end

  def explore
    @categories = Category.order(:category_name)
  end

  def explore_category
    @category = Category.find(params[:id])
    @devices = @category.devices.order(:name)
  end
end
