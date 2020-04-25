class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include ApplicationHelper
  def_delegator :@view, :format_tien
  
  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id:         { source: "User.id" },
      xu:         { source: "User.xu" },
      ref_id:     { source: "User.ref_id" },
      created_at: { source: "Order.created_at" },
    }
  end

  def data
    records.map do |record|
      {
        id:         record.id,
        email:      record.email,
        xu:         format_tien(record.xu),
        ref_user:   record.ref_user,
        created_at: record.created_at.strftime("%H:%M %D"),
        DT_RowId:   record.id, 
      }
    end
  end

  def get_raw_records
    User.user
  end

end
