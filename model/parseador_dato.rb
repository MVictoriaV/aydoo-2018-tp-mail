require_relative 'dato_evento'

class ParseadorDato

	def initialize()
		@dato = nil
	end

	def parsear(un_dato_evento)
		@dato = DatoEvento.new(
						un_dato_evento["remitente"], 
						un_dato_evento["asunto"], 
						un_dato_evento["nombre_evento"], 
						un_dato_evento["lugar_evento"], 
						un_dato_evento["fecha_del_evento"], 
						un_dato_evento["Mail_de_confirmacion"]
						)
		return true
	end

	def dato_evento
		return @dato 
	end
end