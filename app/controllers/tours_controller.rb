class ToursController < ApplicationController
  before_action :admin_account,  only: [:destroy, :index, :new]
  before_action :load_categories, only: [:new, :create, :edit]

  def show
    @tour = Tour.find_by id: params[:id]
    @review_items = Review.all.paginate(page: params[:page], per_page: 6)
    @booking = Booking.new
  end

  def index
    @tour_rows = Tour.where(status: 1).paginate(page: params[:page], per_page: 10)
  end

  def new
    @tour = current_account.tours.build
    @tour.images.build
  end

  def create
    @tour = Tour.new
    @tour.images.build(tour_params)
    @tour.account_id = current_account.id
    @tour.status = 1
    if @tour.save
      insert_data
      flash[:info] = "DONE!"
      redirect_to tours_path
    else
      render :new
    end
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update

  end

  def destroy
    tour = Tour.find(params[:id])
    tour.destroy
    flash[:success] = t("users.deleted")
    redirect_to tours_url
  end
  private

  def load_categories
    @categories = Category.all
  end

  def admin_account
    redirect_to(root_url) unless current_account.role==0
  end

  def tour_params
    params.require(:tour).permit(:category_id, :title, :content, :start_day, :end_day, :price, images_attributes: [:name,:image,:tour_id ])
  end

  def insert_data
    ActiveRecord::Base.transaction do
      params[:images]["path"].each do |image|
        @image = @tour.images.build
        @image.tour_id = @tour.id
        @image.path = image
        @image.save
      end
    end
  end
end
