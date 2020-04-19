class OrdersController < ApplicationController
  def index
  end
  def create
    p order_params
    @order = current_user.orders.create(order_params)
    respond_to do |format|
      if @order
        format.html 
        format.json
        format.js
      else

      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:so_tien, :preferred_ma_the, :preferred_serial, :preferred_nha_mang, :loai_thanh_toan)
  end

end
