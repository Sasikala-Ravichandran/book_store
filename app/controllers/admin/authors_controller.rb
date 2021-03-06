class Admin::AuthorsController < Admin::BaseController

  before_action :set_author, except: [:index, :new, :create]
  
  def index
  end

  def show
    #require 'pry'; binding.pry    
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Author has been created"
      redirect_to [:admin, @author]
    else
      flash.now[:danger] = "Author has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      flash[:success] = "Author has been updated"
      redirect_to [:admin, @author]
    else
      flash.now[:danger] = "Author has not been updated"
      render :edit
    end
  end

  def destroy
    @author.destroy
    flash[:success] = "Author has been destroyed"
    redirect_to admin_authors_path
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end