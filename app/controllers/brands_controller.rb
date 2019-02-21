class BrandsController < ApplicationController
  before_action :set_brand, only: %i[show edit update destroy]

  def index
    @brands = policy_scope(Brand)
    @interests = policy_scope(Interest).where(athlete: current_user.athlete)
    if @brands.nil?
      redirect_to :root
    end
  end

  def show
    authorize @brand
  end

  def new
    @brand = Brand.new
    authorize @brand
  end

  def create
    @brand = Brand.new(brand_params)
    authorize @brand
    @brand.user = current_user
    if @brand.save
      redirect_to @brand
    else
      render :new
    end
  end

  def edit
    authorize @brand
  end

  def update
    if @brand.update(brand_params)
      redirect_to @brand
    else
      render :edit
    end
    authorize @brand
  end

  def destroy
    @brand.user.destroy
    redirect_to :root
    authorize @brand
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name, :slogan, :cnpj)
  end
end
