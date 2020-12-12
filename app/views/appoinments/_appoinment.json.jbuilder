json.extract! appoinment, :id, :start_time, :end_time, :user_id, :doctor_id, :status, :created_at, :updated_at
json.url appoinment_url(appoinment, format: :json)
