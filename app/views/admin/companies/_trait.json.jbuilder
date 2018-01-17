json.extract! company, :id, :name, :is_recruiter, :description, :created_at, :updated_at
json.url admin_company_url(company, format: :json)
