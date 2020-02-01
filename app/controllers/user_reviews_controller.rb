class UserReviewsController < ApplicationController
  include UserReviewsHelper
  before_action :have_review?,  only: [:new]

  def new
    @user_review = current_account.reviews.build
    @tour = Tour.find_by id: params[:id]
  end

  def create
    @review = Review.new(review_params)
    @review.account_id = current_account.id
    @review.status = 1
    if @review.save
     #insert_data
      flash[:info] = t("addsuccess")
      redirect_to user_bookings_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content,:tour_id)
  end

  def review_owner?
  end
end
