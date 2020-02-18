class Account::VoLamFree < Account
  def agent
    Rails.cache.fetch("#{self.cache_key}",  expires_in: 2.hours) do 
      pay = ZingPay.new(username: username, password: password )
      pay.login
      pay.agent
    end
  end
end