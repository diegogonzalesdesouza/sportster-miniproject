class AthletesController < ApplicationController
  before_action :set_athlete, except: %i[index new create]

  def index
    @athletes = policy_scope(Athlete)
    if @athletes.nil?
      redirect_to :root
    end
  end

  def show
  end

  def new
    @athlete = Athlete.new
    authorize @athlete
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.user = current_user
    authorize @athlete

    if @athlete.save
      redirect_to @athlete
    else
      render :new
    end
  end

  def edit; end

  def update
    if @athlete.update(athlete_params)
      redirect_to @athlete
    else
      render :edit
    end
  end

  def destroy
    # sign_out @athlete
    @athlete.user.destroy

    redirect_to :root
    # must log-out && redirect to home page
  end

  private

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :birth_date, :cpf, :profile_photo)
  end

  def set_athlete
    @athlete = Athlete.find(params[:id])
    authorize @athlete
  end
end
