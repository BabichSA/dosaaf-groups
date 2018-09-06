json.array!(@users) do |order|
  json.extract! user, :id, :email, :username, :role
  json.url order_url(user, format: :json)
end
