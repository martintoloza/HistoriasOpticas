class Ciudad < ActiveRecord::Base
  belongs_to :departamento
  has_many :barrios
 #has_many :students, :dependent => :nullify
  	#Validaciones de codigo
	#validates :codigo, :presence => {:message => "Usted debe ingresar un codigo"}, :numericality => {:only_integer => true, :message => "El codigo debe ser numérica"}, :uniqueness => {:message => "Usted ha ingresado un codigo repetido"}
		#Validaciones de nombre
	#validates :nombre, :presence => {:message => "Usted debe ingresar un nombre"}, length: {minimum: 2, maximum: 60, :message => "El nombre debe tener entre 2 y 60 caracteres"}

  filterrific :default_filter_params => { :sorted_by => 'nombre_asc' },
              :available_filters => %w[
                sorted_by
                search_query
                with_departamento_id
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
    num_or_conditions = 2
    where(
      terms.map {
        or_clauses = [
          "LOWER(ciudades.nombre) LIKE ?",
          "LOWER(ciudades.codigo) LIKE ?"
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
    when /^codigo_/
      order("ciudades.codigo #{ direction }")
    when /^nombre_/
      order("LOWER(ciudades.nombre) #{ direction }")
    when /^departamento_nombre_/
      order("LOWER(departamentos.nombre) #{ direction }").includes(:departamento)
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  scope :with_departamento_id, lambda { |departamento_ids|
    where(:departamento_id => [*departamento_ids])
  }
  
  delegate :nombre, :to => :departamento, :prefix => true

  def self.options_for_sorted_by
    [
      ['Nombre (a-z)', 'nombre_asc'],
      ['Nombre (z-a)', 'nombre_desc'],
      ['Código ciudad', 'codigo_asc'],
      ['Departamento (a-z)', 'departamento_nombre_asc']
    ]
  end

end
