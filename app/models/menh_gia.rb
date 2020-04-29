class MenhGia < ApplicationRecord
  self.table_name = 'menh_gias'
  belongs_to :nha_mang
  

  def tien_thuc_te
    so_tien * phan_tram_chiec_khau
  end
end
