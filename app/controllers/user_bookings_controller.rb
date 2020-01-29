class UserBookingsController < ApplicationController

  def index
    @user_booking_rows = Booking.where(account_id: current_account).paginate(page: params[:page], per_page: 20)
  end

  def create
    if logged_in?
      @tour_price = params.require(:booking).permit :tour_price
      @booking = Booking.new(booking_params)
      @booking.account_id = current_account.id
      @booking.status = 0
      byebug
     # @booking.total_price = @tour_price*@booking.amount
      if @booking.save
        flash[:info] = t("addsuccessbook")
        redirect_to root_path
      else
        redirect_to root_path
      end

    else
      redirect_to sessions_path
    end
  end

  def update
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    flash[:success] = t("deletedsuccess")
    redirect_to user_bookings_path
  end

  private
  def booking_params
    params.require(:booking).permit(:amount, :tour_id)
  end
end
