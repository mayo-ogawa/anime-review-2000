class AnimesController < ApplicationController
  before_action :require_user_logged_in
  
  def show
    @anime = Anime.find(params[:id])
    @review = current_user.reviews.build  # form_with 用
    @reviews = Review.order(id: :desc).page(params[:page]).per(6)
  end
  
  def new
    @anime = Anime.new
  end

  def create
    @anime = current_user.animes.build(anime_params)
    if @anime.save
      flash[:success] = 'アニメを投稿しました。'
      
      redirect_to root_url
    else
      @animes = current_user.animes.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'アニメの投稿に失敗しました。'
      
      redirect_to root_url
    end
  end

  def destroy
    @anime = current_user.animes.find(params[:id])
    @anime.destroy
    flash[:success] = 'アニメを削除しました。'
    redirect_to root_url
  end
  
  private

  def anime_params
    params.require(:anime).permit(:name, :image, :content)
  end
end
