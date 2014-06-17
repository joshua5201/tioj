json.array!(@contests) do |contest|
  json.extract! contest, :id, :title, :description, :start_time, :end_time, :contest_type
  
  json.url problem_url(contest, format: :json)
end
