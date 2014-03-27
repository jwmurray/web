json.array!(@auths) do |auth|
  json.extract! auth, :id, :token, :secret, :username
  json.url auth_url(auth, format: :json)
end
