class PagesController < ApplicationController
  def home
    if current_user && current_user.is_athlete
      redirect_to brands_path
    elsif current_user
      redirect_to athletes_path
    end
  end
end
