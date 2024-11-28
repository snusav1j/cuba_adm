json.extract! product_photo, :id, :product_id, :photo_name, :created_at, :updated_at
json.url product_photo_url(product_photo, format: :json)
