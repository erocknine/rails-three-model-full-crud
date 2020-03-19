class AuthorBooksController < ApplicationController

  def create
    if AuthorBook.find_by(author_book_params)
      redirect_to request.referrer
    else
      @author_book = AuthorBook.new(author_book_params)
      if @author_book.save
        redirect_to book_path(author_book_params[:book_id])
      else
        redirect_to author_path(author_book_params[:author_id])
      end
    end
  end


  private
  def author_book_params
    params.require(:author_book).permit(:author_id, :book_id)
  end
end