class BusinessesController < ApplicationController
      before_action :set_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = Business.all
  end

  def show
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.save
    redirect_to business_path(@business)
  end

  def edit
  end

  def update
    @business.update(business_params)
    redirect_to business_path(@business)
  end

  def destroy
    @business.destroy
    redirect_to businesss_path
  end

  private


  def business_params
    params.require(:business).permit(:name, :image, :email, :address, :url)
  end

  def set_business
    @business = Business.find(params[:id])
  end

end
