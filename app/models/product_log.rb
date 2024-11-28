class ProductLog < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  PRODUCT_ADDED = 1
  PRODUCT_CHANGED = 2
  PRODUCT_SOLD = 3
  PRODUCT_DELETED = 4

  def self.create_product_added_log(product_id, user_id)
    self.create(product_id: product_id, user_id: user_id, action: PRODUCT_ADDED)
  end

  def self.create_product_changed_log(product_id, user_id)
    self.create(product_id: product_id, user_id: user_id, action: PRODUCT_CHANGED)
  end

  def self.create_product_sold_log(product_id, user_id)
    self.create(product_id: product_id, user_id: user_id, action: PRODUCT_SOLD)
  end

  def self.create_product_deleted_log(product_id, user_id)
    self.create(product_id: product_id, user_id: user_id, action: PRODUCT_DELETED)
  end
  
  def deleted_user?
    self.user_id == User::DELETED
  end
end
