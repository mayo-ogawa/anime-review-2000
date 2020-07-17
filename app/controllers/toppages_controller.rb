class ToppagesController < ApplicationController
  def index
    if logged_in?
      @animes = Anime.all.page(params[:page])
      @animes = Anime.order(id: :desc).page(params[:page]).per(6)
    end
  end
end
