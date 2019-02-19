class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = policy_scope(Brand)
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
    if @brand.save
      redirect_to :show
    else
      render :new
    end
    authorize @brand
  end

  def edit
    authorize @brand
  end

  def update
    if @brand.update(brand_params)
      redirect_to :show
    else
      redirect_to :edit
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
