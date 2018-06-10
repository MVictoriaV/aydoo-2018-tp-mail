class ArmadorDeEtiquetaSum

	def armar(plantilla) 
		expresion_etiqueta = /[<]+([sum(]+\d+,+\d+[)])+[>]/
		una_etiqueta = plantilla.match(expresion_etiqueta)
		primer_argumento = nil
		segundo_argumento = nil
		if una_etiqueta != nil
			expresion = /\d+,/
			cadena = una_etiqueta.to_s
			un_resultado = cadena.match(expresion)
			primer_argumento = un_resultado.to_s[0,un_resultado.to_s.length - 1]
			primer_argumento = primer_argumento.to_i

			expresion = /,+\d/
			cadena = una_etiqueta.to_s
			un_resultado = cadena.match(expresion)
			segundo_argumento = un_resultado.to_s[1,un_resultado.to_s.length]
			segundo_argumento = segundo_argumento.to_i
			plantilla = plantilla.gsub(expresion_etiqueta, sum(primer_argumento, segundo_argumento).to_s)
		end
		return plantilla
	end

	def sum(primer_argumento, segundo_argumento)
		suma = primer_argumento + segundo_argumento
		return suma.to_s
	end
end