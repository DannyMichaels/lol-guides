json.extract! session, :id, :new, :create, :delete, :created_at, :updated_at
json.url session_url(session, format: :json)
