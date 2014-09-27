class CategoriesController < ActionController::Base
  def show
    @category = Category.find(params[:id])
  end
end
