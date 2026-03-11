class ProfilesController < ApplicationController
  # Profile page requires login
  def show
    @user = current_user
  end
end
