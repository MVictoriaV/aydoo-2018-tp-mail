require_relative '../constantes/constantes_de_fecha'
require_relative '../modules/formateador_fecha'

class ArmadorDeEtiquetaTime

	include ConstantesDeFecha
	include FormateadorFecha

	def armar(plantilla)
		expresion = /[<]+([time])+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			hora_formateada = aplicar_formato(ConstantesDeFecha::FORMATO_HORA_24)
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, hora_formateada)}
		end
		plantilla
	end
end