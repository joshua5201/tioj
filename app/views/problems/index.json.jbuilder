json.array!(@problems) do |problem|
  json.extract! problem, :id, :name, :description, :source
  json.url problem_url(problem, format: :json)
end
