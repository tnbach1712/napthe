class Admin::OrdersController < Admin::BaseController
  def index
  end

  def list_pending_doi_the
    @orders = Order.doi_the.pending
  end

end