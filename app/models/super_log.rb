class SuperLog < ApplicationRecord
  AUTORIZATIONS_LOG = 1
  PROFILES_LOG = 2
  PRODUCTS_LOG = 3

  # productions
  PRODUCT_ADDED = 1
  PRODUCT_CHANGED = 2
  PRODUCT_SOLD = 3
  PRODUCT_DELETED = 4

  # autorizations
  AUTORIZATIONS_LOGIN = 1
  AUTORIZATIONS_LOGOUT = 2

  # get logs #

  def self.get_autorization_logs
    self.where(log_type: SuperLog::AUTORIZATIONS_LOG).all.reverse
  end

  def self.get_product_logs
    self.where(log_type: SuperLog::PRODUCTS_LOG).all.reverse
  end
  # methods #
  
  def self.create_product_added_log(product_id, user_id)
    logs = SuperLog.where(log_type: PRODUCTS_LOG)
    if logs.length >= 30
      logs.delete_all 
    end
    self.create(log_id: product_id, user_id: user_id, action: PRODUCT_ADDED, log_type: PRODUCTS_LOG)
  end

  def self.create_product_changed_log(product_id, user_id)
    logs = SuperLog.where(log_type: PRODUCTS_LOG)
    if logs.length >= 30
      logs.delete_all 
    end
    self.create(log_id: product_id, user_id: user_id, action: PRODUCT_CHANGED, log_type: PRODUCTS_LOG)
  end

  def self.create_product_sold_log(product_id, user_id)
    logs = SuperLog.where(log_type: PRODUCTS_LOG)
    if logs.length >= 30
      logs.delete_all 
    end
    self.create(log_id: product_id, user_id: user_id, action: PRODUCT_SOLD, log_type: PRODUCTS_LOG)
  end

  def self.create_product_deleted_log(product_id, user_id)
    logs = SuperLog.where(log_type: PRODUCTS_LOG)
    if logs.length >= 30
      logs.delete_all 
    end
    self.create(log_id: product_id, user_id: user_id, action: PRODUCT_DELETED, log_type: PRODUCTS_LOG)
  end

  def self.create_user_login_log(user_id)
    auorization_logs = SuperLog.where(log_type: AUTORIZATIONS_LOG)
    if auorization_logs.length >= 30
      auorization_logs.delete_all 
    end
    self.create(log_id: user_id, user_id: user_id, action: AUTORIZATIONS_LOGIN, log_type: AUTORIZATIONS_LOG)
  end

  def self.create_user_logout_log(user_id)
    logs = SuperLog.where(log_type: AUTORIZATIONS_LOG)
    if logs.length >= 30
      logs.delete_all 
    end
    self.create(log_id: user_id, user_id: user_id, action: AUTORIZATIONS_LOGOUT, log_type: AUTORIZATIONS_LOG)
  end

end
