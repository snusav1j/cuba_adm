json.extract! profile_photo, :id, :user_id, :photo_url, :photo_name, :created_at, :updated_at
json.url profile_photo_url(profile_photo, format: :json)
