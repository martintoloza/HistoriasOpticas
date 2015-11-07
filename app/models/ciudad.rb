class Ciudad < ActiveRecord::Base
  	#Validaciones de codigo
	validates :codigo, :presence => {:message => "Usted debe ingresar un codigo"}, :numericality => {:only_integer => true, :message => "El codigo debe ser numérica"}, :uniqueness => {:message => "Usted ha ingresado un codigo repetido"}
		#Validaciones de nombre
	validates :nombre, :presence => {:message => "Usted debe ingresar un nombre"}, length: {minimum: 2, maximum: 60, :message => "El nombre debe tener entre 2 y 60 caracteres"}
end