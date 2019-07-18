class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    current_user.favorites.create(book: @book)

    redirect_to @book
  end

  def destroy
    favorite = Favorite.find(params[:id])
    @book = favorite.book
    favorite.destroy

    redirect_to @book
end
