class PagesController < ApplicationController
  def home
    if current_user && current_user.is_athlete
      redirect_to all_brands_path
    elsif current_user
      redirect_to all_athletes_path
    end
  end
end
