  class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: [ :user, :admin ]

  has_many :orders
  
  def nap_tien(_xu)
    return if _xu <= 0
    self.xu += _xu
    save
  end

  def rut_tien(_xu)

    return if _xu <= 0 || xu <= 0 || (_xu > xu )
    self.xu -= _xu
    save
  end

  def ref_user
    User.find(ref_id) if ref_id.present?
  end

  def xac_nhan_chuyen_tien(order)
    tien_can_chuyen = order.so_tien
    if(tien_can_chuyen > xu)
      order.fail!
      order.update_attributes(note: "Không đủ tiền để chuyển")
    else
      user_nhan = User.find_by_email(order.preferred_tai_khoan_den )
      if user_nhan.blank?
        order.fail!
        order.update_attributes(note: "Không tìm thấy thông tin người nhận")
      elsif user_nhan == self
        order.fail!
        order.update_attributes(note: "Không thể tự gởi")
      else
        User.transaction do
          self.rut_tien(tien_can_chuyen)
          user_nhan.nap_tien(tien_can_chuyen)
          order.success!
          order.update_attributes(note: "Đã chuyên tiền thành công vào lúc #{Time.now.strftime('%H:%M %D') }")
        end
      end
    end
  end
end
