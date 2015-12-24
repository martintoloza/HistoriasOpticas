json.array!(@ciudades) do |ciudad|
  json.extract! ciudad, :id, :codigo, :nombre, :departamento_id
  json.url ciudad_url(ciudad, format: :json)
end
