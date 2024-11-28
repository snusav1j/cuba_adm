class User < ApplicationRecord

  DELETED = 9999999999999

  def director?
    self.role == Role::DIRECTOR
  end

  def ceo?
    self.role == Role::CEO
  end

  def admin?
    self.role == Role::ADMIN
  end

  def seo?
    self.role == Role::SEO
  end

  def buisness?
    self.role == Role::BUISNESS
  end

  def programeer?
    self.role == Role::PROGRAMMER
  end

  def test?
    self.role == Role::TEST
  end

  def support?
    self.role == Role::SUPPORT
  end

  def role_name
    self.role = Role.find_by(id: self.role).present? ? Role.find_by(id: self.role).role_name : nil
  end

  def fullname
    if self.firstname != self.lastname
      "#{self.firstname} #{self.lastname}"
    else
      "#{self.firstname}"
    end
  end

  

end
