class Category < ActiveRecord::Base
  has_and_belongs_to_many :books

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
  end

  def create
    @category = Category.new create_params
  end

  private

      def create_params
        params.require(:category).permit(:name, :book_ids)
      end
end
