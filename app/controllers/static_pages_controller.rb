class StaticPagesController < ApplicationController
  def home
    @tours = Tour.where(status: 1).where('start_day > ?', Time.now.to_datetime.in_time_zone).order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def donetours
    @tours = Tour.where(status: 1).where('start_day <= ?', Time.now.to_datetime.in_time_zone).order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def help; end
end

