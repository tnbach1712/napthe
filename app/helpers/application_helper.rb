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

  def format_status(status)
    _class =  case status
              when :success || 'success'
                "badge badge-success"
              when :fail || 'fail'
                "badge badge-error"
              when :pending || 'pending' 
                "badge badge-warning"
              else
                "badge badge-warning"
              end
    _text =  case status
              when :success || 'success'
                "Thành công"
              when :fail || 'fail'
                "Thất bại"
              when :pending || 'pending'
                "Chờ xử lý"
              else
                "Chờ xử lý"
              end      
    content_tag(:span, _text, class: _class)
  end

  def btn_confirm_the_thanh_cong(order)
    content_tag :div do
      link_to("Thành Công", doi_the_success_admin_order_path(order), class: "btn btn-primary", remote: true, :method => :post) + 
      link_to("Thất Bại", doi_the_fail_admin_order_path(order), class: "btn btn-danger ", remote: true, :method => :post)
    end
  end

  def btn_confirm_order_thanh_cong
  end

  def btn_confirm_order_that_bai
  end
end
