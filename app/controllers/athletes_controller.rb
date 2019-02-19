class AthletesController < ApplicationController
  before_action :set_athlete, except: %i[index new create]

  def index
    @athletes = Athlete.all
    authorize @athletes
  end

  def show; end

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)

    if @athlete.save
      redirect_to :show
    else
      render :new
    end
  end

  def edit; end

  def update
    if @athlete.update
      redirect_to :show
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
    params.require(:athlete).permit(:first_name, :last_name, :birth_date, :cpf)
  end

  def set_athlete
    @athlete = Athlete.find(params[:id])
  end
end
