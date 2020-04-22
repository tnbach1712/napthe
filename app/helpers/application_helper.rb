module ApplicationHelper
  def current_order
    if current_user
      current_user.orders.new(loai_thanh_toan: 0)
    else
      Order.new(loai_thanh_toan: 0)
    end
  end

  def format_tien(xu)
    number_to_currency( xu , precision: 0, unit: 'đ', separator: ',', delimiter: '.', format: '%n%u') 
  end
end
