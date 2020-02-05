class RattingsController < ApplicationController
  before_action :can_rate?, only: [:create]

  def create
    ratting = Ratting.new(ratting_params)
    ratting.account_id = current_account.id
    ratting.status = 1
    stars = params[:ratting][:star].to_i
    tour = Tour.find(params[:ratting][:tour_id])
    tour.avg_rate = (tour.avg_rate*tour.rate_amount + stars)/(tour.rate_amount + 1)
    tour.rate_amount += 1
    if ratting.save && tour.update_columns(avg_rate: tour.avg_rate, rate_amount: tour.rate_amount)
      flash[:success] = t("addsuccess")
      redirect_to root_path
    else
      flash[:danger] = t("fail")
      redirect_to root_path
    end
  end

  private

  def can_rate?
    booking = Booking.where(account_id: current_account.id, tour_id: params[:ratting][:tour_id].to_i).first
    if !booking.present? || !booking.status = "accepted"
      flash[:danger] = t("didnotbook")
      redirect_to root_path
      if Ratting.where(account_id: current_account.id, tour_id: params[:ratting][:tour_id].to_i).first.present?
        flash[:danger] = t("yourated")
      end
    end
  end

  def ratting_params
    params.require(:ratting).permit(:tour_id, :star)
  end
end
