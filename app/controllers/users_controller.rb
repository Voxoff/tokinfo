  class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize(@user)
    @business = Business.where(user: @user)
    @tokens = Token.where(user: @user)
  end

  def index
    @users = User.all
  end
end
