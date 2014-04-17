json.array!(@custom_fields) do |custom_field|
  json.extract! custom_field, :id, :name, :parent_type, :field_type, :displayed
  json.url custom_field_url(custom_field, format: :json)
end
