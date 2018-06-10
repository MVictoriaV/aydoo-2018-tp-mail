class ArmadorDeEtiquetaTime

	def armar(plantilla) 
		expresion = /[<]+([time]+[:]+24|[time])+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			un_formato = formato_hora(una_etiqueta.to_s)
			plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, un_formato)}
		end
		return plantilla
	end

	def formato_hora(una_etiqueta)
		una_hora = nil
		if una_etiqueta[una_etiqueta.length - 3, 2] == '24'
			formato_de_fecha = "%H:%M"
			una_hora = Time.now.strftime(formato_de_fecha)
		else
			una_hora = Time.now.strftime("%R")
		end
	end
end