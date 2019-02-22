class InterestsController < ApplicationController
  def index
    @interests = policy_scope(Interest)
    if @interests.nil?
      redirect_to :root
    end
  end

  def create
    if Interest.where(athlete_id: interest_params[:athlete_id], brand_id: interest_params[:brand_id]) == []
      @interest = Interest.new(interest_params)
      authorize @interest

      if interest_params[:brand_id]
        @interest.athlete = current_user.athlete
      else
        @interest.brand = current_user.brand
      end
    else
      @interest = Interest.where(interest_params).first
      authorize @interest

      if interest_params[:brand_interest]
        @interest.brand_interest = interest_params[:brand_interest]
      else
        @interest.brand_interest = interest_params[:athlete_interest]
      end
    end

    @interest.save

    redirect_to :root
  end

  def update
    @interest = Interest.find(params[:id])
    authorize @interest
    @interest.update(interest_params)

    redirect_to :root
  end

  def destroy
    @interest = Interest.find(params[:id])
    authorize @interest
    @interest.destroy

    redirect_to :root
  end

  private

  def interest_params
    params.permit(:athlete_id, :brand_id, :athlete_interest, :brand_interest)
  end
end
