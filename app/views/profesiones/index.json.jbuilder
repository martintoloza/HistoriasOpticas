json.array!(@profesiones) do |profesion|
  json.extract! profesion, :id, :codigo, :nombre
  json.url profesion_url(profesion, format: :json)
end
