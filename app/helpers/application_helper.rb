module ApplicationHelper
  def current_order
    if current_user
      current_user.orders.new(loai_thanh_toan: 0)
    else
      Order.new(loai_thanh_toan: 0)
    end
  end
end
