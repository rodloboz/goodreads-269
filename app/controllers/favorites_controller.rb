class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    current_user.favorites.create(book: @book)

    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    @book = favorite.book
    favorite.destroy

    respond_to do |format|
      format.html { redirect_to @book }
      format.js { render :create }
    end
  end
end
