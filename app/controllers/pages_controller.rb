class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @search = ""
    @featured_tokens = Token.limit(3)
    @tokens = Token.all
  end

end
