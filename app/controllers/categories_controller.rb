class CategoriesController < ApplicationController
  before_action :admin_account,  only: [:destroy, :index, :new]

  def index
    @category_rows = Category.all.paginate(page: params[:page], per_page: 20)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.status = 1
    if @category.save
      flash[:info] = t("addsuccess")
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find_by id: params[:id]
  end

  def update
    @category = Category.find_by id: params[:id]
    if @category.update_attributes(category_params_edit)
      flash[:success] = t("updatedsuccess")
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:success] = t("deletedsuccess")
    redirect_to categories_url
  end

  private
  def admin_account
    redirect_to(root_url) unless current_account.admin?
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def category_params_edit
    params.require(:category).permit(:name, :status)
  end
end
