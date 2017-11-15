class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @search = ""
    @tokens = Token.limit(4)
  end
end
