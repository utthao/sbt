class RevenueController < ApplicationController

  def index
    @revenue = 0
  end

  def create
    revenue_month = params[:month].to_i
    done_bookings = Booking.where(status: "accepted")
    @count_done_bookings = 0
    @revenue = 0
    done_bookings.each do |done_booking|
      if done_booking.tour.start_day.to_i <= Time.now.to_i && done_booking.tour.start_day.to_i >= revenue_month.months.ago.to_i
        @revenue +=done_booking.total_price
        @count_done_bookings += 1
      end
    end
    respond_to do |format|
      format.js
    end
  end
end
