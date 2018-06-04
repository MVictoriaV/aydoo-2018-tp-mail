require 'json'
require_relative 'parseador_dato'

class ExcepcionParseador < StandardError

	def initialize(un_mensaje)
		@mensaje_de_error = un_mensaje
	end
end

class ParseadorJson

	def initialize()
		@dato = nil
		@cuerpo_del_mail = nil
	end
	def parsear(un_json)
		
		if un_json.nil? || un_json.empty?
			raise ExcepcionParseador.new("El parametro ingresado no puede ser nil o estar vacio.")
  			return false
  		end
		un_json = JSON.parse(un_json)

  		unless (un_json["datos"].nil?)
  			@dato = ParseadorDato.new
  			datos = un_json["datos"]
  			@dato.parsear(datos)
  		end
  		unless (un_json["template"].nil?)
  			@cuerpo_del_mail = un_json["template"]
  		end  		
  		return true
	end

	def get_dato
		return @dato.dato_evento
	end

	def get_cuerpo_mail
		return @cuerpo_del_mail
	end
end