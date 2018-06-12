class ParseadorDato

	def initialize()
		@dato = nil
	end

	def parsear(un_dato_evento)
		dato_hash = un_dato_evento.to_h
		@dato = OpenStruct.new(dato_hash)
		return true
	end

	def dato_evento
		return @dato 
	end
end