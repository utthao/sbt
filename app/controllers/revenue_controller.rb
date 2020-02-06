class RevenueController < ApplicationController

  def index
  end

  def create
    revenue_month = params[:month].to_i
    done_bookings = Booking.where(status: "accepted")
    revenue = 0
    done_bookings.each do |done_booking|
      if done_booking.tour.start_day.to_i <= Time.now.to_i && done_booking.tour.start_day.to_i >= revenue_month.months.ago.to_i
        revenue +=done_booking.total_price
      end
    end
    byebug
    redirect revenue_index_path
  end
end
