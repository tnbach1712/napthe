class Order < Base
  NhaMang = ["Viettel", 'Vinaphone', 'Mobifone', 'Zing', 'Vcoin']
  enum loai_thanh_toan: [:doi_the, :ban_tai_khoan, :chuyen_tien, :rut_tien]
  enum status: [:pending, :processing, :success, :fail]
  before_create :generate_number
  belongs_to :user
  validates :so_tien, numericality: { greater_than: 0 }
  validate :the_nap
  validate :so_tien_rut

  delegate :email, to: :user, allow_nil: true

  preference :nha_mang, :string, default: ""
  preference :serial, :string, default: ""
  preference :ma_the, :string, default: ""
  preference :tai_khoan_den, :string

  def the_nap
    if doi_the?
      if Order::NhaMang.exclude? preferred_nha_mang
        errors.add(:preferred_nha_mang, "Nhà mạng không hợp lệ")
      end
    end
  end

  def the_thanh_cong!
    return false if success? || fail?
    success!
    # cong tiền vào tài khoản
    # tính tiền cộng
    nha_mang = ::NhaMang.find_by(ten: self.preferred_nha_mang)
    tien_duoc_cong = so_tien * nha_mang.phan_tram_chiec_khau
    self.user.nap_tien(tien_duoc_cong)
    # cong tien cho ref_user
    self.user.ref_user.nap_tien(so_tien*0.01) if self.user.try(:ref_user).present?
  end

  def the_that_bai!
    return false if success? || fail?
    fail!
  end

  protected
  def generate_number
    self.number = loop do
      random_number = SecureRandom.urlsafe_base64(10, false)
      break random_number unless Order.exists?(number: random_number)
    end
  end

  def so_tien_rut
    if loai_thanh_toan == 'rut_tien' || loai_thanh_toan == 'chuyen_tien'
      so_tien_con_lai = self.user.xu
      if (so_tien_con_lai < so_tien)
        errors.add(:"so_tien", "Không đủ tiền để  thanh toán.")
      end
    end
  end

end
