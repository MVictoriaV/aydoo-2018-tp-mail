require 'json'
require_relative 'parseador_dato'
require_relative 'parseador_contacto'

class ExcepcionParseador < StandardError

	attr_reader :object
	def initialize(object)
		@object = object
	end
end

class ParseadorJson

	def initialize()
		@dato = nil
		@cuerpo_del_mail = nil
		@parser_contacto = nil
	end

	def parsear(un_json)
		json_ok = {"resultado": "ok"}
		if un_json.nil? || un_json.empty?
  			return lanzar_error
  		end
		un_json = JSON.parse(un_json)

		parsea_dato(un_json)
		parsea_contacto(un_json)
		unless (un_json["template"].nil?)
  			@cuerpo_del_mail = un_json["template"]
  		else
  			return lanzar_error
  		end
  		
  		return json_ok
	end

	def lanzar_error
		json_error = '{"resultado": "error, entrada incorrecta"}'
		raise ExcepcionParseador.new(self), json_error
	end

	def parsea_dato(un_json)
		unless (un_json["datos"].nil?)
	  		@dato = ParseadorDato.new
	  		resultado = @dato.validar_dato(un_json["datos"])
	  		if !resultado
	  			return lanzar_error
	  		end
  			datos = un_json["datos"]
  			@dato.parsear(datos)
  		else
  			return lanzar_error
  		end
	end

	def parsea_contacto(un_json)
		unless (un_json["contactos"].nil?)
			contactos = un_json["contactos"]
			un_parser = ParseadorContacto.new
			hash_contactos = JSON.parse(contactos.to_json)
			@parser_contacto = un_parser.parsear(hash_contactos)
		else
			return lanzar_error
		end
	end

	def get_contactos
		return @parser_contacto
	end

	def get_dato
		return @dato.dato_evento
	end

	def get_cuerpo_mail
		return @cuerpo_del_mail
	end
end