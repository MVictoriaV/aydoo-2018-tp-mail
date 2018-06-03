class ExcepcionContacto < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end
end

class Contacto

	def initialize(un_nombre, un_apellido, un_mail)
		validar_argumentos(un_nombre, "debe tener un nombre.")
		validar_argumentos(un_apellido, "debe tener un apellido.")
		validar_argumentos(un_mail, "debe tener un mail.")
		@nombre = un_nombre
		@apellido = un_apellido
		@mail = un_mail
  	end

  	def validar_argumentos(un_argumento, un_mensaje)
		if un_argumento == nil or un_argumento.size == 0  
	    	raise ExcepcionContacto.new("El contacto"), un_mensaje
	    end
  	end

  	def get_nombre()
  		return @nombre
  	end

  	def get_apellido()
  		return @apellido
  	end

  	def get_mail()
  		return @mail
  	end
end