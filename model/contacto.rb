class ExcepcionContacto < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end
end

class Contacto

	def initialize(un_nombre, un_apellido, un_mail)
		validar_argumentos(un_nombre, un_apellido, un_mail)
		@nombre = un_nombre
		@apellido = un_apellido
		@mail = un_mail
  	end

  	def validar_argumentos(un_nombre, un_apellido, un_mail)
		if un_nombre == nil or un_nombre.size == 0  
	    	raise ExcepcionContacto.new("El contacto"), "debe tener un nombre."
	    end
	    if un_apellido == nil or un_apellido.size == 0  
	    	raise ExcepcionContacto.new("El contacto"), "debe tener un apellido."
	    end
	    if un_mail == nil or un_mail.size == 0  
	    	raise ExcepcionContacto.new("El contacto"), "debe tener un mail."
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