class ReviewsController < ApplicationController
  def show
    @review = Review.find_by id: params[:id]
  end
end
