class OrderDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include ApplicationHelper
  def_delegator :@view, :format_tien
  def_delegator :@view, :format_status
  def_delegator :@view, :btn_confirm_the_thanh_cong
  
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

  def get_raw_records
    orders = case type
    when :doi_the
      Order.doi_the.pending
    else
      Order.all
    end
    orders = orders.where("preferences like '%nha_mang: #{params[:search_nha_mang]}%' ") if params["search_nha_mang"].present?
    orders

  end

  def type
    
    @type ||= options[:type]
  end
end
