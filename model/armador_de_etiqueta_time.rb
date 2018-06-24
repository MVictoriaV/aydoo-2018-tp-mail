require_relative 'etiqueta_time_no_soportada_exception'

class ArmadorDeEtiquetaTime

	def armar(plantilla) 
		begin
			comprobar_etiqueta(plantilla)
		rescue Exception => msg
	        puts msg.message
	    end
		expresion = /[<]+([time]+[:]+12|[time])+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			un_formato = formato_hora(una_etiqueta.to_s)
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(expresion, un_formato)}
		end
		plantilla
	end

	def formato_hora(una_etiqueta)
		una_hora = nil
		if una_etiqueta[una_etiqueta.length - 3, 2] == '12'
			una_hora = Time.now.strftime("%R")
		else
			formato_de_fecha = "%H:%M"
			una_hora = Time.now.strftime(formato_de_fecha)
		end
	end

	def comprobar_etiqueta(plantilla)
		expresion = /<time+:(?!12).+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
      		raise EtiquetaTimeNoSoportadaException.new
    	end
	end
end