class StaticPagesController < ApplicationController
  def home
    @tour_items = Tour.all.paginate(page: params[:page], per_page: 6)
  end

  def help; end
end
