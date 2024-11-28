class UserProfilesController < ApplicationController
  before_action :ensure_current_user
  
  def index
    @users = User.all
  end

  def change_profile_photo
    id = params[:id]
    @user = User.find_by(id: id)
    @profile_photo = params[:profile_photo]
    path_original = "#{@user.id}_#{@user.login}#{File.extname(@profile_photo.original_filename)}"
    dir = Rails.root.join('public', 'files', 'profile_imgs', "#{@user.id}")
    FileUtils.remove_dir "#{Rails.root}/public/files/profile_imgs/#{@user.id}", true
    sleep(0.3)
    Dir.mkdir(dir) unless Dir.exist?(dir)
    @uploaded = File.open(Rails.root.join(dir.join(path_original)), 'wb') do |file|
      file.write(@profile_photo.read)
    end
    if @uploaded
      profile_photo = ProfilePhoto.find_by(user_id: @user.id)
      if profile_photo.present?
        profile_photo.update(photo_name: path_original)
      else
        ProfilePhoto.create(user_id: id, photo_name: path_original)
      end
      
    end
  end

  def show
    id = params[:id]
    @user = User.find_by(id: id)
    
  end

end