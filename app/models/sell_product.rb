class SellProduct < ApplicationRecord

  def SellProduct.sell_product(product_id, sell_price, user_id)
    if SellProduct.all.length >= 50
      SellProduct.delete_all 
    end
    self.create(product_id: product_id, sell_price: sell_price, user_id: user_id)
  end

end
