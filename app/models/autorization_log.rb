class AutorizationLog < ApplicationRecord

  def self.create_log(user)
    AutorizationLog.delete_all if AutorizationLog.all.length > 50
    self.create(user_id: user.id)
  end

end
