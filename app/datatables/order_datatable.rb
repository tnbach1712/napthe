class OrderDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include ApplicationHelper
  def_delegator :@view, :format_tien
  def_delegator :@view, :format_status
  def_delegator :@view, :btn_confirm_the_thanh_cong
  def_delegator :@view, :btn_confirm_order_thanh_cong
  def_delegator :@view, :btn_confirm_order_that_bai
  def_delegator :@view, :link_to
  def_delegator :@view, :order_fail_admin_order_path
  def_delegator :@view, :order_success_admin_order_path
  
  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id:         { source: "Order.id" },
      number:     { source: "Order.number" },
      so_tien:    { source: "Order.so_tien" },
      status:     { source: "Order.status" },
      created_at:     { source: "Order.created_at" },
    }
  end

  def data
    records.map do |record|
      type_format(record)
    end
  end

  def get_raw_records
    orders = case type
    when :doi_the
      Order.doi_the.pending
    when :rut_tien
      Order.rut_tien.pending
    else
      Order.all
    end
    orders = orders.where("preferences like '%nha_mang: #{params[:search_nha_mang]}%' ") if params["search_nha_mang"].present?
    orders

  end

  def type
    @type ||= options[:type]
  end

  def type_format(record)
    case type
    when :rut_tien
      {
        id:         record.id,
        number:     record.number,
        nha_mang:   record.preferred_nha_mang,
        serial:     record.preferred_serial,
        ma_the:     record.preferred_ma_the,
        so_tien:    format_tien(record.so_tien),
        email:      record.user.try(:email),
        status:     format_status(record.status),
        created_at: record.created_at.strftime("%H:%M %D"),
        btn_success: link_to("Thành Công", order_success_admin_order_path(record), class: "btn btn-primary", remote: true, :method => :post),
        btn_fail: link_to("Hủy", order_fail_admin_order_path(record), class: "btn btn-warning", remote: true, :method => :post),
        DT_RowId:   record.id, 
      }
    when :doi_the
      {
        id:         record.id,
        number:     record.number,
        nha_mang:   record.preferred_nha_mang,
        serial:     record.preferred_serial,
        ma_the:     record.preferred_ma_the,
        so_tien:    format_tien(record.so_tien),
        email:      record.user.try(:email),
        status:     format_status(record.status),
        created_at: record.created_at.strftime("%H:%M %D"),
        btn_controls: btn_confirm_the_thanh_cong(record),
        DT_RowId:   record.id, 
      } 
    else
      {
        id:         record.id,
        number:     record.number,
        nha_mang:   record.preferred_nha_mang,
        serial:     record.preferred_serial,
        ma_the:     record.preferred_ma_the,
        so_tien:    format_tien(record.so_tien),
        email:      record.user.try(:email),
        status:     format_status(record.status),
        created_at: record.created_at.strftime("%H:%M %D"),
        btn_controls: btn_confirm_the_thanh_cong(record),
        DT_RowId:   record.id, 
      } 
    end 
  end
end
