module UserReviewsHelper
  def tour_done?(id)
    tour = Booking.find_by id: params[:id]
    return if (tour.start_day.start_day > Time.now.to_i) && tour.status=="accepted"
  end

  def have_review?
    #@user_review = current_account.reviews.build
    @tour = Tour.find_by id: params[:id]
    review = Review.where(account_id: current_account.id).where(tour_id: @tour.id).first
    if review
      flash[:warning] = "da review roi"
      redirect_to review_path(review)
    end
  end

  def review_owner?
    if account_signed_in?
      if @review.account_id == current_account.id
        return true
      end
    else
      return false
    end
  end
end
