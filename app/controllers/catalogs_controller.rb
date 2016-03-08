class CatalogsController < ApplicationController
  
  before_action :set_cart_if_session, except: [:search]
  
  def index
    @books = Book.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @books = Book.search_by_title(params[:search_name])
  end

  private

  def set_cart_if_session
    set_cart if session[:cart_id]
  end

end