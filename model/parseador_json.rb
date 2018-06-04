require 'json'
require_relative 'parseador_dato'
require_relative 'parseador_contacto'

class ExcepcionParseador < StandardError

	def initialize(un_mensaje)
		@mensaje_de_error = un_mensaje
	end
end

class ParseadorJson

	def initialize()
		@dato = nil
		@cuerpo_del_mail = nil
		@parser_contacto = nil
	end
	def parsear(un_json)
		
		if un_json.nil? || un_json.empty?
			raise ExcepcionParseador.new("El parametro ingresado no puede ser nil o estar vacio.")
  			return false
  		end
		un_json = JSON.parse(un_json)

		parsea_dato(un_json)
		parsea_contacto(un_json)
		unless (un_json["template"].nil?)
  			@cuerpo_del_mail = un_json["template"]
  		end		
  		
  		return true
	end

	def parsea_dato(un_json)
		unless (un_json["datos"].nil?)
  			@dato = ParseadorDato.new
  			datos = un_json["datos"]
  			@dato.parsear(datos)
  		end
	end

	def parsea_contacto(un_json)
		unless (un_json["contactos"].nil?)
			contactos = un_json["contactos"]
			@parser_contacto = ParseadorContacto.new
			hash_contactos = JSON.parse(contactos.to_json)
			@parser_contacto.parsear(hash_contactos)
		end
	end

	def get_dato
		return @dato.dato_evento
	end

	def get_cuerpo_mail
		return @cuerpo_del_mail
	end
end