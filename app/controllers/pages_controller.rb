class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[landing home]

  def home
    if current_user && current_user.is_athlete
      redirect_to all_brands_path
    elsif current_user
      redirect_to all_athletes_path
    else
      redirect_to landing_path
    end
  end

  def landing
  end
end
