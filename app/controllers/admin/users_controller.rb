class Admin::UsersController < Admin::BaseController
  def index
   
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(params, view_context: view_context) }
    end
  end
end
