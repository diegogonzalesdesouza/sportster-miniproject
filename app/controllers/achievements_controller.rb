class AchievementsController < ApplicationController
  before_action :set_athlete, only: [:new, :create]
  before_action :set_achievement, only: [:destroy]
  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    @achievement.athlete = @athlete
    if @achievement.save
      redirect_to @athlete
    else
      render :new
    end
  end

  def destroy
    athlete = @achievement.athlete
    @achievement.destroy
    redirect_to athlete
  end

  private

  def set_athlete
    @athlete = Athlete.find(params[:athlete_id])
  end

  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

  def achievement_params
    params.require(:achievement).permit(:name, :position, :date, :description)
  end
end
