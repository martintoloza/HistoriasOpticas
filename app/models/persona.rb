class Persona < ActiveRecord::Base
  belongs_to :ciudad
  belongs_to :barrio
  belongs_to :profesion

	validates :nroiden, :presence => {:message => "Usted debe ingresar Doc. Identidad"}, length: {minimum: 5, maximum: 15, :message => "El Doc. Identidad debe tener entre 5 y 15 caracteres"}
	validates :pri_ape, :presence => {:message => "Usted debe ingresar Primer Apellido"}, length: {minimum: 5, maximum: 20, :message => "El 1er.Apellido debe tener entre 5 y 20 caracteres"}
	validates :pri_nom, :presence => {:message => "Usted debe ingresar Primer Nombre"}, length: {minimum: 5, maximum: 20, :message => "El 1er.Nombre debe tener entre 5 y 20 caracteres"}

  filterrific :default_filter_params => { :sorted_by => 'apellidos_asc' },
              :available_filters => %w[
                sorted_by
                search_query
              ]
  #             with_estado_id

  # default for will_paginate
  self.per_page = 10

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condición de consulta, analizar en cada palabra clave
    terms = ('%' + query.downcase).split(/\s+/)
    # reemplazar "*" con "%" para las búsquedas de comodín,
    # añadir '%', eliminar duplicados '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configurar varias condiciones o para la prestación
    # de los argumentos de interpolación. Ajuste esto si
    # cambiar el número de condiciones o.
    num_or_conditions = 4
    where(
      terms.map {
        or_clauses = [
          "LOWER(personas.pri_ape) LIKE ?",
          "LOWER(personas.seg_ape) LIKE ?",
          "LOWER(personas.pri_nom) LIKE ?",
          "LOWER(personas.seg_nom) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }
  
  scope :sorted_by, lambda { |sort_option|
    # extraer la dirección de ordenación del valor param.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^apellidos_/
      order("LOWER(personas.pri_ape) #{ direction }, LOWER(personas.seg_ape) #{ direction }")
    when /^nombres_/
      order("LOWER(personas.pri_nom) #{ direction }, LOWER(personas.seg_nom) #{ direction }")
    when /^documento_/
      order("personas.nroiden #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Apellidos (a-z)', 'apellidos_asc'],
      ['Apellidos (z-a)', 'apellidos_desc'],
      ['Nombres (a-z)', 'nombres_asc'],
      ['Nombres (z-a)', 'nombres_desc'],
      ['Doc.Identidad', 'documento_asc']
    ]
  end

  def apellidos
    [pri_ape, seg_ape].compact.join(', ')
  end
  def nombres
    [pri_nom, seg_nom].compact.join(', ')
  end

end
