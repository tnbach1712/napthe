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
    return if _xu >= 0
    self.xu -= _xu
    save
  end
end
