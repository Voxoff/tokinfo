class FollowingsController < ApplicationController
  def index
    @followings = policy_scope(Following)
  end

  def new
    @following = Following.new
    authorize @following
  end

  def create
    @following = Following.new(following_params)
    @following.user_id = user.id
    authorize @following
    if @following.save
      redirect_to following_path(@following)
    else
      redirect_to root
    end
  end

  def destroy
    @following = Following.find(params[:id])
    authorize @following
    @following.destroy
    redirect_to root
  end

  private

  def following_params
    params.require(:following).permit(:id)
  end
end
