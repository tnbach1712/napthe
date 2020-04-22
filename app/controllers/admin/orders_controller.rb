class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:doi_the_success, :doi_the_fail]

  def index
  end

  def list_pending_doi_the
    @orders = Order.doi_the.pending
  end


  def doi_the_success
   @order.success!
  end
  
  def doi_the_fail
   @order.fail!
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end
end