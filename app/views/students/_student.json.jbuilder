json.extract! student, :id, :full_name, :phone, :address, :work, :grade, :driving_hours, :created_at, :updated_at
json.url student_url(student, format: :json)
