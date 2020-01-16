class CategoriesController < ApplicationController
  def index
    @category_rows = Category.all.paginate(page: params[:page], per_page: 20)
  end
end
