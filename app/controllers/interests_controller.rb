class InterestsController < ApplicationController
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
    authorize @interest

  end

  private

  def interest_params
    params.permit(:athlete_id, :brand_id)
  end
end
