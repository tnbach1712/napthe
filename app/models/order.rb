class Order < Base
  enum loai_thanh_toan: [:doi_the, :ban_tai_khoan, :chuyen_tien]
  enum status: [:pending, :processing, :success, :fail]
  before_create :generate_number
  belongs_to :user
  validates :so_tien, numericality: { greater_than: 0 }

  delegate :email, to: :user, allow_nil: true

  preference :nha_mang, :string, default: ""
  preference :serial, :string, default: ""
  preference :ma_the, :string, default: ""

  protected
  def generate_number
    self.number = loop do
      random_number = SecureRandom.urlsafe_base64(10, false)
      break random_number unless Order.exists?(number: random_number)
    end
  end

end
