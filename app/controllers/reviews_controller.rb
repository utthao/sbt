class ReviewsController < ApplicationController
  def show
    @like = Like.new
    @review = Review.find_by_id(params[:id])
    @comment_items = Comment.all.order("created_at DESC")
    @comment = Comment.new
  end

  def edit
    @review = Review.find_by id: params[:id]
    @tour = Tour.find_by id: @review.tour_id
  end

  def update
    @review = Review.find_by id: params[:id]
    if @review.update_attributes(review_params_edit)
      flash[:success] = t("updatedsuccess")
      redirect_to review_path
    else
      render :edit
    end
  end

  private
  def review_params_edit
    params.require(:review).permit(:status)
  end
end
