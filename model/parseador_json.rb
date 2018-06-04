require 'json'
require_relative 'parseador_dato'

class ExcepcionParseador < StandardError

	def initialize(un_mensaje)
		@mensaje_de_error = un_mensaje
	end
end

class ParseadorJson

	def parsear(un_json)
		if un_json.nil? || un_json.empty?
			raise ExcepcionParseador.new("El parametro ingresado no puede ser nil o estar vacio.")
  			return false
  		end
  		unless (un_json["datos"].nil?)
  			
  			@dato = ParseadorDato.new
  			datos = JSON.parse(un_json["datos"].to_json)
  			puts datos
  			@dato.parsear(datos)
  		end
  		return true
	end

end