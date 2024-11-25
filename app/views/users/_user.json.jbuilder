json.extract! user, :id, :firstname, :lastname, :role, :email, :login, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
