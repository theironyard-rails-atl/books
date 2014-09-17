class BookshelvesController < ApplicationController
  def index
    @shelves = current_user.book_shelves
  end
  
  def create
    shelf = current_user.book_shelves.new
    shelf.name = params[:bookshelves][:name]
    shelf.save!
    redirect_to :back
  end
  
  def destroy
    shelf = current_user.book_shelves.find(params[:id])
    shelf.destroy!
    redirect_to :back
  end

end
