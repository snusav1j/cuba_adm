module ApplicationHelper
  
  def roles
    current_user.ceo? ? Role.all.map{|r| [r.role_name, r.id]} : Role.where.not(id: Role::CEO).map{|r| [r.role_name, r.id] }
  end
  
  def marketplaces
    MarketPlace.all.map{|mp| [mp.marketplace_name, mp.id]}
  end
  
  def product_expenses
    expenses = 0
    Product.all.each do |p|
      expenses += p.buy_price
    end
    expenses
  end
  
  def product_income
    income = 0
    SellProduct.all.each do |p|
      income += p.sell_price
    end
    income
  end

  def user_photo_name(user_id)
    ProfilePhoto.find_by(user_id: user_id).photo_name
  end
  
  def current_user_profile_photo
    # Rails.cache.clear
    if current_user
      profile_photo_model = ProfilePhoto.find_by(user_id: current_user.id)
      if profile_photo_model
        if profile_photo_model.has_file?
          profile_photo = "/files/profile_imgs/#{current_user.id}/#{user_photo_name current_user.id}"
        end
      end
    end
    if !profile_photo.nil?
      image_tag profile_photo, id: "photo-previev"
    else
      image_tag "/files/profile_imgs/no_image/user_img.png", id: "photo-previev"
    end
  end

  def user_profile_photo(user_id)
    # Rails.cache.clear
    user = User.find_by(id: user_id)
    if user
      profile_photo_model = ProfilePhoto.find_by(user_id: user.id)
      if profile_photo_model
        if profile_photo_model.has_file?
          profile_photo = "/files/profile_imgs/#{user.id}/#{user_photo_name user.id}"
        end
      end
    end
    if !profile_photo.nil?
      image_tag profile_photo, id: "photo-previev"
    else
      image_tag "/files/profile_imgs/no_image/user_img.png", id: "photo-previev"
    end
  end

  def pretty_date(date)
		Russian::strftime(date, "%d %B %Y") if date.present?
  end

  def pretty_date_month_year(date)
		Russian::strftime(date, "%B %Y") if date.present?
  end

  def pretty_number(number, delimiter = '')
    number_to_currency number, precision: 0, delimiter: delimiter, unit: ""
  end

  def pretty_decimal(number, separator = '.', delimiter = '')
    NumberHelper.number_to_currency number, precision: 2, delimiter: delimiter, unit: "", separator: separator
  end

  def pretty_date_time(date)
    Russian::strftime(date, "%d %B %Y %H:%M") if date.present?
  end

  def small_date(date)
    date = date.to_datetime + 3.hours
    date.strftime("%d.%m.%Y") if date.present?
  end

  def time_only(date)
    date = date.to_datetime + 3.hours
    date.strftime("%H:%M") if date.present?
  end

  def smallest_date(date)
    date = date.to_datetime + 3.hours
    date.strftime("%d.%m") if date.present?
  end

  def small_datetime(date)
    date = date.to_datetime + 3.hours
    date.strftime("%d.%m.%Y %H:%M") if date.present?
  end

  def autorization_text_info(user, auth_log)
    "#{user.fullname} авторизовался #{small_datetime(auth_log.created_at)}"
  end

end
