class ToursController < ApplicationController
  before_action :admin_account,  only: [:destroy, :index, :new]
  before_action :load_categories, only: [:new, :create, :edit]

  def show
    @tour = Tour.find_by id: params[:id]
    @review_items = Review.all.paginate(page: params[:page], per_page: 6)
    @booking = Booking.new
    @images = @tour.images
  end

  def index
    @tour_rows = Tour.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @tour = current_account.tours.build
    @images = @tour.images.build
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.account_id = current_account.id
    @tour.status = 1
    if @tour.save
     insert_data
      flash[:info] = t("addsuccess")
      redirect_to tours_path
    else
      render :new
    end
  end

  def edit
    @tour = Tour.find_by id: params[:id]
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update_attributes(tour_params_edit)
      flash[:success] = t("updatedsuccess")
      redirect_to tours_path
    else
      render :edit
    end
  end

  def destroy
    tour = Tour.find(params[:id])
    tour.destroy
    flash[:success] = t("deletedsuccess")
    redirect_to tours_url
  end
  private

  def load_categories
    @categories = Category.all
  end

  def admin_account
    redirect_to(root_url) unless admin_acount?
  end

  def tour_params
    params.require(:tour).permit(:category_id, :title, :content, :start_day, :end_day, :price, images: [:id, :tour_id, :path])
  end

  def tour_params_edit
    params.require(:tour).permit(:category_id, :title, :content, :start_day, :end_day, :price, :status, images: [:id, :tour_id, :path])
  end

  def insert_data
    ActiveRecord::Base.transaction do
       params[:images][:path].each do |a|
          @tour.images.create! path: a
        end
    end
  end
end
