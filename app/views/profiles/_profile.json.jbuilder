json.extract! profile, :id, :name, :hours, :title, :how, :why, :what, :advice, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
