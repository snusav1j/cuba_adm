json.extract! sell_product, :id, :product_id, :sell_price, :created_at, :updated_at
json.url sell_product_url(sell_product, format: :json)
