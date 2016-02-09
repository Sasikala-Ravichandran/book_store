class BooksController < ApplicationController

  before_action :require_login
  before_action :require_admin

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @publishers = Publisher.all
    @authors = Author.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book has been created"
      redirect_to @book
    else
      flash.now[:danger] = "Book has not been created"
      @publishers = Publisher.all
      @authors = Author.all
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book has been updated"
      redirect_to @book
    else
      flash.now[:danger] = "Book has not been updated"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = "Book has been destroyed"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :description, :page_count, :price, :published_at, :book_cover,
                                  :publisher_id, author_ids: [])
  end

end 