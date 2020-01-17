class CategoriesController < ApplicationController
  before_action :admin_account,  only: [:destroy, :index, :new]

  def index
    @category_rows = Category.all.paginate(page: params[:page], per_page: 20)
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:success] = t("deletedsuccess")
    redirect_to categories_url
  end

  private
  def admin_account
    redirect_to(root_url) unless admin_acount?
  end
end
