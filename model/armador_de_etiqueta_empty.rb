class ArmadorDeEtiquetaEmpty

	def armar(plantilla) 
		expresion_etiqueta = /[<]+([empty(]+[a-z]+,+[a-z]+[)])+[>]/
		una_etiqueta = plantilla.match(expresion_etiqueta)
		primer_argumento = nil
		segundo_argumento = nil
		if una_etiqueta != nil
			expresion = /[a-z]+,/
			cadena = una_etiqueta.to_s
			un_resultado = cadena.match(expresion)
			primer_argumento = un_resultado.to_s[0,un_resultado.to_s.length - 1]

			expresion = /([a-z])+[)]/
			cadena = una_etiqueta.to_s
			un_resultado = cadena.match(expresion)
			segundo_argumento = un_resultado.to_s[0,un_resultado.to_s.length - 1]
			plantilla.gsub(expresion_etiqueta, empty(primer_argumento, segundo_argumento))
		end
		return plantilla
	end

	def empty(primer_argumento, segundo_argumento)
		unless (primer_argumento == nil || primer_argumento.length == 0) || primer_argumento == 'nil'
			return primer_argumento
		end
		return segundo_argumento
	end
end