json.array!(@matters) do |matter|
  json.extract! matter, :id, :case_number, :judge_id, :commissioner_id, :client_id, :opp_id, :court_id
  json.url matter_url(matter, format: :json)
end
