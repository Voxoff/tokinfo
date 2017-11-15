  class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize(@user)
    @business = Business.where(user_id: @user.id)
    @tokens = Token.where(user_id: @user.id)
  end

  def index
    @users = User.all
  end
end
