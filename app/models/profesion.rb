class Profesion < ActiveRecord::Base
  # belongs_to :ciudad
	validates :nombre, :presence => {:message => "Usted debe ingresar un nombre"}, length: {minimum: 5, maximum: 100, :message => "El nombre debe tener entre 5 y 100 caracteres"}

  filterrific :default_filter_params => { :sorted_by => 'nombre_asc' },
              :available_filters => %w[
                sorted_by
                search_query
              ]

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
    num_or_conditions = 1
    where(
      terms.map {
        or_clauses = [
          "LOWER(profesiones.nombre) LIKE ?"
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
   when /^nombre_/
      order("LOWER(profesiones.nombre) #{ direction }")
   else
      raise(ArgumentError, "Opción de clasificación válido: #{ sort_option.inspect }")
    end
  }
end
