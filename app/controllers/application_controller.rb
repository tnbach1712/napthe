class ApplicationController < ActionController::Base
  
  before_action :set_ref

  def set_ref
    cookies[:ref_id] = params[:ref_id] if params[:ref_id].present?
  end
end
