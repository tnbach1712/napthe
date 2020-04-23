class OrdersController < ApplicationController
  def index
  end
  def create
    p order_params
    @order = case type_order 
      when 'doi_the'
        current_user.orders.create(order_params)
      when 'rut_tien'
        current_user.orders.create(order_rut_tien_params)
      when 'chuyen_tien'
        current_user.orders.create(order_chuyen_tien_params)
      end

    respond_to do |format|
      if @order
        format.html 
        format.json
        format.js
      else
        format.html 
        format.json
        format.js
      end
    end
  end

  def get_users
    @users = User.where("email like '#{ params[:email]}%' ").map{|k| {id: k.email, text: k.email }  }
    respond_to do |format|
      format.json {render json: @users }
    end
  end

  private
  def order_params
    params.require(:order).permit(:so_tien, :preferred_ma_the, :preferred_serial, :preferred_nha_mang, :loai_thanh_toan)
  end

  def order_rut_tien_params
    params.require(:order).permit(:so_tien, :loai_thanh_toan)
  end

  def order_chuyen_tien_params
    params.require(:order).permit(:so_tien, :preferred_tai_khoan_den, :loai_thanh_toan)
  end

  def type_order
    params[:order][:loai_thanh_toan]
  end
end
