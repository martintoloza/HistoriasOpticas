json.array!(@personas) do |persona|
  json.extract! persona, :id, :tipoiden, :nroiden, :pri_ape, :seg_ape, :pri_nom, :seg_nom, :sexo, :fechanac, :uniedad, :edad, :zonaresi, :direccion, :email, :tipousua, :tipoafili, :est_civil, :estado, :ciudad_id, :barrio_id, :profesion_id
  json.url persona_url(persona, format: :json)
end
