class Admin::DashboardController < Admin::BaseController
  def index
    @transactions =  Transaction.order('id desc')
  end
end