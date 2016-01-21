json.array!(@barrios) do |barrio|
  json.extract! barrio, :id, :nombre, :ciudad_id
  json.url barrio_url(barrio, format: :json)
end
