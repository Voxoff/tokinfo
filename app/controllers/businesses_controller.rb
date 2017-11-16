class BusinessesController < ApplicationController
      before_action :set_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = policy_scope(Business)
    @featured = Business.last
  end

  def show
    authorize @business
    @tokens = Token.where(business_id: @business.id)
    @business_coordinates = { lat: @business.latitude, lng: @business.longitude }
  end

  def new
    @business = Business.new
    authorize @business
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    authorize @business
    @business.save
    redirect_to root_path
  end

  def edit
    authorize @business
  end

  def update
    authorize @business
    @business.update(business_params)
    redirect_to business_path(@business)
  end

  def destroy
    authorize @business
    @business.destroy
    redirect_to businesses_path
  end

  private

  def business_params
    params.require(:business).permit(:name, :image, :email, :address, :url, :photo, :description)
  end

  def set_business
    @business = Business.find(params[:id])
  end

end
