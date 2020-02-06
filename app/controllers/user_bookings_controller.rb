class UserBookingsController < ApplicationController
  before_action :check_booking_accepted, only: [:destroy]
  before_action :check_have_book, only: [:create]

  def index
    @user_booking_rows = Booking.where(account_id: current_account).paginate(page: params[:page], per_page: 20)
  end

  def create
    if logged_in?
      if !check_have_book
        flash[:danger] = t("youbookedyet")
        redirect_to root_path
      else
        @tour_price = params[:booking][:tour_price].to_i
        @booking = Booking.new(booking_params)
        @booking.account_id = current_account.id
        @booking.status = 0
       @booking.total_price = @tour_price*@booking.amount
        if @booking.save
          flash[:info] = t("addsuccessbook")
          start_day = @booking.tour.start_day
          days_before_start = (start_day.to_i - Time.now.to_i)/ (24 * 3600)
          AutoUpdateBookingStatusJob.set(wait: days_before_start.days).perform_later(@booking.id) #tự động chuyển status nếu cách start_day 1 ngày mà vẫn uncheck
          redirect_to root_path
        else
          flash[:success] = t("fail")
          redirect_to root_path
        end
      end
    else
      redirect_to sessions_path
    end
  end

  def update
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.status = "canceled"
    if booking.save
      flash[:success] = t("cancelsuccess")
      redirect_to user_bookings_path
    else
      flash[:danger] = t("fail")
      redirect_to user_bookings_path
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:amount, :tour_id)
  end

  def check_have_book
    bookings = Booking.where(account_id: current_account.id, tour_id: params[:booking][:tour_id].to_i)
    bookings.each do |booking|
      if booking.present? && booking.status != "canceled"
        return false
      end
    end
    # if booking.present? && booking.status != "canceled"
    #   flash[:danger] = t("youbookedyet")
    #   redirect_to root_path
    # end
  end

  def check_booking_accepted
    booking = Booking.find(params[:id])
    if booking.status == "accepted"
      flash[:danger] = t("haveaccepted")
      redirect_to user_bookings_path
    end
  end

end
