class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @business = Business.where(user_id: @user.id)
    @token = Token.where(user_id: @user.id)
  end

  def index
    @users = User.all
  end
end
