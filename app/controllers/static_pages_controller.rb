class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @search = Tour.ransack params[:q]
    @tours = @search.result.where(status: 1).includes(:category).where('start_day > ?', Time.now.to_datetime.in_time_zone).order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def donetours
    @categories = Category.all
    @search = Tour.ransack params[:q]
    @tours = @search.result.where(status: 1).where('start_day <= ?', Time.now.to_datetime.in_time_zone).order("created_at DESC").paginate(page: params[:page], per_page: 6)
  end

  def help; end
end
