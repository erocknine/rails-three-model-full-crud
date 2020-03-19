class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.books << Book.find(params[:id])
    @author.update(author_params)
    redirect_to author_path(@author)
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author
    else
      render :new
    end
  end

  def delete_author_books
    @author_books = AuthorBook.find_by(author_id: params[:author_id], book_id: params[:book_id])
    @author_books.destroy
    redirect_to Author.find(params[:author_id])
  end

  private
  def author_params
    params.require(:author).permit(:name, :birth_year)
  end

end
