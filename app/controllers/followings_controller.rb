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
    @following.user_id = current_user.id
    authorize @following
    if @following.save
      respond_to do |format|
        @token = Token.find(params[:token_id])
        format.js
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @following = Following.find(params[:id])
    authorize @following
    @following.destroy
    respond_to do |format|
      @token = Token.find(params[:token_id])
      format.js
    end
  end

  private

  def following_params
    params.permit(:token_id)
  end
end
