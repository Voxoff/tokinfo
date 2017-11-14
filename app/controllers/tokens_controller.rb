class TokensController < ApplicationController
    before_action :set_token, only: [:show, :edit, :update, :destroy]

  def index
    @tokens = policy_scope(Token)
  end

  def show
    @users = User.all
    authorize(@token)
  end

  def new
    @token = Token.new
    authorize(@token)
  end

  def create
    @token = Token.new(token_params)
    authorize(@token)
    @token.save
    redirect_to token_path(@token)
  end

  def edit
    authorize(@token)
  end

  def update
    authorize(@token)
    @token.update(token_params)
    redirect_to token_path(@token)
  end

  def destroy
    authorize(@token)
    @token.destroy
    redirect_to tokens_path
  end

  private


  def token_params
    params.require(:token).permit(:name, :image, :photo)
  end

  def set_token
    @token = Token.find(params[:id])
  end
end
