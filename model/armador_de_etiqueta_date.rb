require_relative 'etiqueta_no_soportada_exception'
require_relative '../constantes/constantes_de_fecha'
require_relative '../modules/formateador_fecha'

class ArmadorDeEtiquetaDate

	include ConstantesDeFecha
	include FormateadorFecha

	def armar(plantilla) 
		begin
			comprobar_etiqueta(plantilla)
		rescue Exception => msg
	        puts msg.message
	    end
		expresion = /[<]+([date]+[:]+[d|i])+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			un_formato = dar_formato_fecha(una_etiqueta.to_s)
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, un_formato)}
		end
		plantilla
	end

	def dar_formato_fecha(una_etiqueta)
		formato_de_fecha = ConstantesDeFecha::FORMATO_FECHA
		if una_etiqueta[una_etiqueta.length - 2, 1] == 'i'
			formato_de_fecha = ConstantesDeFecha::FORMATO_FECHA_INVERTIDA
		end
		fecha_actual = aplicar_formato(formato_de_fecha)
	end

	def comprobar_etiqueta(plantilla)
		expresion = /<date+:(?!d|i).+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
      		raise EtiquetaNoSoportadaException.new('Etiqueta date sin comportamiento definido, no se realiza reemplazo sobre la misma.')
    	end
	end
end