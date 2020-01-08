class ToursController < ApplicationController

  def show
    @tour = Tour.find_by id: params[:id]
    @review_items = Review.all.paginate(page: params[:page], per_page: 6)
    @booking = Booking.new
  end

end
