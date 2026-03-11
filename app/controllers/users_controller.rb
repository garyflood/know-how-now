class UsersController < ApplicationController
  before_action :authenticate_user!

  # Profile page for the currently logged-in user
  def show
    @user = current_user
  end
end
