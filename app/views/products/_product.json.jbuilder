json.extract! product, :id, :product_name, :description, :author_id, :available, :marketplace, :buy_price, :sold, :sell_price, :created_at, :updated_at
json.url product_url(product, format: :json)
