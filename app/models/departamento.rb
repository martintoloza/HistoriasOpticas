class Departamento < ActiveRecord::Base

  has_many :ciudades
  #has_many :ciudad, :dependent => :nullify
  # collection_select(:ciudad, :departamento_id, @deptos, :id, :nombre, prompt: true)
  def self.options_for_select
    order('LOWER(nombre)').map { |e| [e.nombre.capitalize, e.id] }
  end

end
