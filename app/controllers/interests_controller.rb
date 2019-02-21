class InterestsController < ApplicationController

  def index
    @interests = policy_scope(Interest)
    if @interests.nil?
      redirect_to :root
    end
  end

  def create
    @interest = Interest.new(interest_params)
    authorize @interest

    if interest_params[:brand_id]
      @interest.athlete = current_user.athlete
    else
      @interest.brand = current_user.brand
    end
    @interest.save
  end

  def destroy
    @interest = Interest.find(params[:id])
    authorize @interest
    @interest.destroy
  end

  private

  def interest_params
    params.permit(:athlete_id, :brand_id)
  end
end
