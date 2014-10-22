json.array!(@scripts) do |script|
  json.extract! script, :id, :content
  json.url script_url(script, format: :json)
end
