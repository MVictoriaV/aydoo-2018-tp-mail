require_relative '../constantes/constantes_de_fecha'
require_relative '../modules/formateador_fecha'
require_relative '../constantes/constantes_de_expresiones_regulares'

class ArmadorDeEtiquetaTime

	include ConstantesDeFecha
	include FormateadorFecha
	include ConstantesDeExpresionesRegulares

	def armar(plantilla)
		expresion = ConstantesDeExpresionesRegulares::ETIQUETA_TIME
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			hora_formateada = aplicar_formato(ConstantesDeFecha::FORMATO_HORA_24)
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, hora_formateada)}
		end
		plantilla
	end
end