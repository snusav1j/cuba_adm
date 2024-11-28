json.extract! product_log, :id, :product_id, :action, :created_at, :updated_at
json.url product_log_url(product_log, format: :json)
