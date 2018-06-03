require 'json'

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
  		return true
	end
end