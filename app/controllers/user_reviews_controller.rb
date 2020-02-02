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

  def edit
    @user_review = Review.find_by id: params[:id]
    @tour = Tour.find_by id: @user_review.tour_id
  end

  def update
    @user_review = Review.find_by id: params[:id]
    if @user_review.update_attributes(edit_review_params)
      flash[:success] = t("updatedsuccess")
      redirect_to edit_user_review_path
    else
      render :edit
    end
  end

  def destroy
    @user_review = Review.find_by id: params[:id]
    @user_review.destroy
    flash[:success] = t("deletedsuccess")
    redirect_to user_bookings_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :content,:tour_id)
  end

    def edit_review_params
    params.require(:review).permit(:title, :content)
  end

end
