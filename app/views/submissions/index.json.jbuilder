json.array!(@submissions) do |submission|
  json.extract! submission, :id, :code, :compiler, :result, :score
  json.url submission_url(submission, format: :json)
end
