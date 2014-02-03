json.array!(@problems) do |problem|
  json.extract! problem, :id, :name, :description, :input, :output, :example_input, :example_output, :hint, :source
  json.limit_attributes do 
    json.extract! problem.limit, :time, :memory, :output
  end
  json.url problem_url(problem, format: :json)
end
