json.extract! super_log, :id, :log_id, :user_id, :action, :log_type, :created_at, :updated_at
json.url super_log_url(super_log, format: :json)
