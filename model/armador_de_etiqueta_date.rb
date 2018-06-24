require_relative 'etiqueta_no_soportada_exception'

class ArmadorDeEtiquetaDate

	def armar(plantilla) 
		begin
			comprobar_etiqueta(plantilla)
		rescue Exception => msg
	        puts msg.message
	    end
		expresion = /[<]+([date]+[:]+[d|i])+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			un_formato = formato_hora(una_etiqueta.to_s)
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, un_formato)}
		end
		plantilla
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

	def comprobar_etiqueta(plantilla)
		expresion = /<date+:(?!d|i).+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
      		raise EtiquetaNoSoportadaException.new('Etiqueta date sin comportamiento definido, no se realiza reemplazo sobre la misma.')
    	end
	end
end