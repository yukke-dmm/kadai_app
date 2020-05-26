class BlogsController < ApplicationController
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
  	book = Book.new(blog_params)
  	book.save
  	redirect_to blog_path(book)
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(blog_params)
  	redirect_to blog_path(book.id)
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to blog_path
  end

  private
  def blog_params
  	params.require(:book).permit(:title, :body)
  end
end
