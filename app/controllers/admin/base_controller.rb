class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :authenticate_admin!


  def authenticate_admin!
    if !current_user.role == 1
      sign_out current_user 
      redirect_to "/"
    end
  end
  
end