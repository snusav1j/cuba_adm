class Product < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  SOLD = 1
  ACTIVE = 2

  def self.get_active_products
    self.where(sold: Product::ACTIVE).all
  end

  def self.get_sold_products
    self.where(sold: Product::SOLD).all
  end

  def sold?
    self.available <= 0
  end
end
