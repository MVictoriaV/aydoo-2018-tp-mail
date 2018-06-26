require_relative 'etiqueta_no_soportada_exception'
require_relative '../modules/formateador_fecha'
require_relative '../constantes/constantes_de_fecha'
require_relative '../constantes/constantes_de_expresiones_regulares'

class ArmadorDeEtiquetaTime12

	include ConstantesDeFecha
	include FormateadorFecha
	include ConstantesDeExpresionesRegulares

	def armar(plantilla) 
		begin
			comprobar_etiqueta(plantilla)
		rescue Exception => msg
	        puts msg.message
	    end
		expresion = ConstantesDeExpresionesRegulares::ETIQUETA_TIME_12
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			hora_formateada = aplicar_formato(ConstantesDeFecha::FORMATO_HORA_12)
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, hora_formateada)}
		end
		plantilla
	end

	def comprobar_etiqueta(plantilla)
		expresion = ConstantesDeExpresionesRegulares::ETIQUETA_TIME_12_EXCEPTION
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
      		raise EtiquetaNoSoportadaException.new('Etiqueta time sin comportamiento definido, no se realiza reemplazo sobre la misma.')
    	end
	end
end