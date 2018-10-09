json.extract! instructor, :id, :full_name, :phone, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
