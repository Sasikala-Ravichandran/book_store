class Admin::BaseController < ApplicationController
 
  before_action :require_login
  before_action :require_admin
 
  def index
  end

end