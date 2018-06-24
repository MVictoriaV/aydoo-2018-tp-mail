require_relative '../constantes/constantes_datos'
require_relative '../modules/formateador_fecha'

class ArmadorDeEtiquetaTime

	include Constantes
	include FormateadorFecha

	def armar(plantilla)
		expresion = /[<]+([time])+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			un_formato = aplicar_formato(Constantes::FORMATO_HORA_24)
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, un_formato)}
		end
		plantilla
	end
end