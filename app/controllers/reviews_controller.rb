class ReviewsController < ApplicationController
  
  def create
    @review = current_user.reviews.build(review_params)
    @anime = Anime.find(params[:anime_id])
    @review.anime_id = @anime.id
    if @review.save
      flash[:success] = 'コメントを投稿しました。'
      
      redirect_to @anime
    else
      @reviews = current_user.reviews.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      
      redirect_to @anime
    end
  end
  
  private

  def review_params
    params.require(:review).permit(:content)
  end

end
