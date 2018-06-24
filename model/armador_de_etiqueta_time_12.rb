require_relative 'etiqueta_no_soportada_exception'
require_relative '../constantes/constantes_datos'
require_relative '../modules/formateador_fecha'

class ArmadorDeEtiquetaTime12

	include Constantes
	include FormateadorFecha

	def armar(plantilla) 
		begin
			comprobar_etiqueta(plantilla)
		rescue Exception => msg
	        puts msg.message
	    end
		expresion = /[<]+([time]+[:]+12)+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			un_formato = aplicar_formato(Constantes::FORMATO_HORA_12)
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, un_formato)}
		end
		plantilla
	end

	def comprobar_etiqueta(plantilla)
		expresion = /<time+:(?!12).+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
      		raise EtiquetaNoSoportadaException.new('Etiqueta time sin comportamiento definido, no se realiza reemplazo sobre la misma.')
    	end
	end
end