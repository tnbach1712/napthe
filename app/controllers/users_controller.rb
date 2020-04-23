class UsersController < ApplicationController
  def history
    @history_orders = current_user.orders
  end

  def rut_tien
    @order = current_user.orders.new(loai_thanh_toan: :rut_tien)
  end

  def nap_tien
  end

  def chuyen_tien
    @order = current_user.orders.new(loai_thanh_toan: :chuyen_tien)
  end

  def xac_nhan_chuyen_tien
    @order = current_user.orders.create(order_chuyen_tien_params)
    current_user.xac_nhan_chuyen_tien(@order)
    @order.reload
    respond_to do |format|
      format.js
    end
  end
  
  private
  def order_chuyen_tien_params
    params.require(:order).permit(:so_tien, :preferred_tai_khoan_den, :loai_thanh_toan)
  end

end
