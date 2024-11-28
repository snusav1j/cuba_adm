class ProfilePhoto < ApplicationRecord

  def profile_photo_url
    "/files/profile_imgs/#{self.user_id}/#{self.photo_name}"
  end

  def has_file?
    self.photo_name.present?
  end

end
