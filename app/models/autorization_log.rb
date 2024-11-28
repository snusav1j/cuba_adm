class AutorizationLog < ApplicationRecord

  def self.create_log(user)
    if AutorizationLog.all.length >= 25
      AutorizationLog.delete_all 
    end
    self.create(user_id: user.id)
  end

  def deleted_user?
    self.user_id == User::DELETED
  end

end
