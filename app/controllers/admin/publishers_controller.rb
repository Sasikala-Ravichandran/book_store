class Admin::PublishersController < Admin::BaseController

  def index
  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:success] = "Publisher has been created"
      redirect_to [:admin, @publisher]
    else
      flash.now[:danger] = "Publisher has not been created"
      render :new
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update(publisher_params)
      flash[:success] = "Publisher has been updated"
      redirect_to [:admin, @publisher]
    else
      flash.now[:danger] = "Publisher has not been updated"
      render :edit
    end
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    flash[:success] = "Publisher has been destroyed"
    redirect_to admin_publishers_path
  end
  private

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end