class TokensController < ApplicationController
    before_action :set_token, only: [:show, :edit, :update, :destroy]

  def index
    @tokens = policy_scope(Token)
  end

  def show
  end

  def new
    @token = Token.new
  end

  def create
    @token = Token.new(token_params)
    @token.save
    redirect_to token_path(@token)
  end

  def edit
  end

  def update
    @token.update(token_params)
    redirect_to token_path(@token)
  end

  def destroy
    @token.destroy
    redirect_to tokens_path
  end

  private


  def token_params
    params.require(:token).permit(:name, :image)
  end

  def set_token
    @token = Token.find(params[:id])
  end


end
