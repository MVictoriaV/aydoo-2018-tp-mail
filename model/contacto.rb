require_relative 'contacto_exception'

class Contacto

  attr_accessor :nombre
  attr_accessor :apellido
  attr_accessor :mail

	def initialize(un_nombre, un_apellido, un_mail)
		validar_atributo(un_nombre, "El contacto debe tener un nombre.")
		validar_atributo(un_apellido, "El contacto debe tener un apellido.")
		validar_atributo(un_mail, "El contacto debe tener un mail.")
		@nombre = un_nombre
		@apellido = un_apellido
		@mail = un_mail
  end

  private

  def validar_atributo(argumento, mensaje_de_error)
	  raise ContactoException.new(mensaje_de_error) if (argumento.nil? || argumento.empty?)
  end
end