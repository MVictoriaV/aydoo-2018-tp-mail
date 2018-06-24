require_relative 'etiqueta_empty_con_reemplazos_nulos_exception'
require_relative 'etiqueta_empty_con_primer_argumento_nulo_exception.rb'
require_relative 'etiqueta_empty_con_segundo_argumento_nulo_exception.rb'

class ArmadorDeEtiquetaEmpty

	def armar(plantilla) 
		expresion_etiqueta = /[<][empty]+[(].+[a-z].+,.+[a-z]+.[)]+[>]/
		una_etiqueta = plantilla.match(expresion_etiqueta)
		primer_argumento = nil
		segundo_argumento = nil
		if una_etiqueta != nil
			una_etiqueta
			una_etiqueta = una_etiqueta.to_s.gsub(/\s/, "")
			expresion = /[a-z]+,/
			cadena = una_etiqueta.to_s
			un_resultado = cadena.match(expresion)
			primer_argumento = un_resultado.to_s[0,un_resultado.to_s.length - 1]

			expresion = /([a-z])+[)]/
			cadena = una_etiqueta.to_s
			un_resultado = cadena.match(expresion)
			segundo_argumento = un_resultado.to_s[0,un_resultado.to_s.length - 1]

			begin
				plantilla = plantilla.gsub(expresion_etiqueta, empty(primer_argumento, segundo_argumento))
			rescue Exception => msg
		        puts msg.message
		    end
		end
		plantilla
	end

	def empty(primer_argumento, segundo_argumento)
    	comprobar_argumentos(primer_argumento, segundo_argumento)
		unless (primer_argumento == nil || primer_argumento.length == 0) || primer_argumento == 'pais'
			return primer_argumento
		end
		return segundo_argumento
	end

	def comprobar_argumentos(primer_argumento, segundo_argumento)
		if primer_argumento == 'nil' && segundo_argumento == 'nil'
      		raise EtiquetaEmptyConReemplazosNulosException.new
    	end

    	if primer_argumento == 'nil'
      		raise EtiquetaEmptyConPrimerArgumentoNuloException.new
    	end

    	if segundo_argumento == 'nil'
      		raise EtiquetaEmptyConSegundoArgumentoNuloException.new
    	end
	end
end