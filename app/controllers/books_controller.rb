class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  respond_to :html, :json

  def reviews
    @book = Book.find params[:id]
    @reviews = @book.reviews
  end

  def recommendations
    @recommendations = current_user.received_recommendations
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
  end

  def create
    @book = Book.new create_params
    @book.book_data_lookup
    if @book.save
      render :show
    else
      render_invalid @book
    end
  end

  def update
    @book = Book.find params[:id]
    authorize! :edit, @book
    if @book.update update_params
      render :show
    else
      render_invalid @book
    end
  end

  def review
    raise "Not yet implemented"
  end

  def recommend
    raise "Not yet implemented"
  end

private

  def create_params
    params.require(:book).
      permit(:title, :author, :isbn, :image_url, :description).
      merge(created_by: current_user)
  end

  def update_params
    params.require(:book).permit(:title, :author, :isbn, :image_url, :description)
  end
end
