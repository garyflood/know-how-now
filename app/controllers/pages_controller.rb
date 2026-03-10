class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :explore ]

  def home
  end

  def explore
  end
end
