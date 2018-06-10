class ArmadorDeEtiquetaDate

	def armar(plantilla) 
		expresion = /[<]+([date]+[:]+[d|i])+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			un_formato = formato_hora(una_etiqueta.to_s)
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, un_formato)}
		end
		return plantilla
	end

	def formato_hora(una_etiqueta)
		formato_de_fecha = nil
		if una_etiqueta[una_etiqueta.length - 2, 1] == 'i'
			formato_de_fecha = "%Y-%m-%d"
		else
			formato_de_fecha = "%d-%m-%Y"
		end
		fecha_actual = Time.now.strftime(formato_de_fecha)
	end
end