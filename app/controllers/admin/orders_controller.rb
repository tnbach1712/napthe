class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:doi_the_success, :doi_the_fail]

  def index
    @orders = Order.doi_the.paginate(page: params[:page], per_page: 30)
  end

  def list_pending_doi_the
    @orders = Order.doi_the.pending.paginate(page: params[:page], per_page: 30)
  end


  def doi_the_success
    respond_to do |format|
      if @order.the_thanh_cong!
        format.js
      else
        format.js
      end
    end

  end

  def doi_the_fail
    respond_to do |format|
      if @order.the_that_bai!
        format.js
      else
        format.js
      end
    end
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end
end