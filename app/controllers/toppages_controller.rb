class ToppagesController < ApplicationController
  def index
    if logged_in?
      @animes = Anime.all.page(params[:page])
    end
  end
end
