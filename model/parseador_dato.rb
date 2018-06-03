class ParseadorDato

	def parsear(un_dato_evento)
		un_dato_evento.each do |clave, valor|
		  puts "Clave < #{clave} > y valor < #{valor} >"
		end
		return true
	end
end