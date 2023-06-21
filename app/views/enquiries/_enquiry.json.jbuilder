json.extract! enquiry, :id, :email, :first_name, :last_name, :message, :created_at, :updated_at
json.url enquiry_url(enquiry, format: :json)
