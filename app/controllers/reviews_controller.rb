class ReviewsController < ApplicationController
  def show
    @review = Review.find_by id: params[:id]
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
