json.array!(@testdata) do |testdatum|
  json.extract! testdatum, :id, :input, :answer
  json.url testdatum_url(testdatum, format: :json)
end
