class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end
  
  def delete_author_books
    @author_book = AuthorBook.find_by(author_id: params[:author_id], book_id: params[:book_id])
    @author_book.destroy
    redirect_to Book.find(params[:book_id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :page_count, :author_books)
  end
end
