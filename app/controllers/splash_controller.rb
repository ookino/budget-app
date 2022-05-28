class SplashController < ApplicationController
  def index
    redirect_to groups_path if logged_in?
  end
end
