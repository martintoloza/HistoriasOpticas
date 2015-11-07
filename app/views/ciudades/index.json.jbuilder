json.array!(@ciudades) do |ciudad|
  json.extract! ciudad, :id, :codigo, :nombre
  json.url ciudad_url(ciudad, format: :json)
end
