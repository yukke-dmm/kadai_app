class BooksController < ApplicationController

# topページの代わり
  def new
  end

  def index
   	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end



  def create
  	book = Book.new(book_params)
  	if book.save
      flash[:notice] = "Book was successfully created."
  	  redirect_to book_path(book)
    else
      @books = Book.all
      @book = book
      render action: :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
      flash[:notice] = "Book was successfully created."
  	  redirect_to book_path
    else
      @books = Book.all
      @book = book
      render action: :index
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    else
      @books = Book.all
      @book = book
      render action: :index
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end

