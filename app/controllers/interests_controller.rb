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

    if @interest.save
      @athlete = Athlete.find(interest_params[:athlete_id])
      respond_to do |format|
        format.html { redirect_to :root }
        format.js # <-- will render `app/views/interests/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    @interest = Interest.find(interest_params[:id])
    authorize @interest

    if @interest.update(interest_params)
      @athlete = Athlete.find(interest_params[:athlete_id])
      respond_to do |format|
        format.html { redirect_to :root }
        format.js # <-- will render `app/views/interests/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    authorize @interest
    @interest.destroy

    @athlete = Athlete.find(params[:athlete_id])

    respond_to do |format|
      format.html { render :root }
      format.js # <-- will render `app/views/interests/destroy.js.erb`
    end
  end

  private

  def interest_params
    params.permit(:id, :athlete_id, :brand_id, :athlete_interest, :brand_interest)
  end
end
