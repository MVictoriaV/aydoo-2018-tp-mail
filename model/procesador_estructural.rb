require_relative '../constantes/constantes_datos'
require_relative 'etiqueta_inexistente_exception'

class ProcesadorEstructural

	attr_accessor :estructura
	include Constantes

	#Crea una estructura general con un hash pasado por parametro
	def crear_estructura(informacion)
		@estructura = OpenStruct.new(informacion)
		verificar_existencia_etiquetas
	end

	private
	def verificar_existencia_etiquetas
		etiquetas_requeridas = Constantes::ETIQUETAS_REQUERIDAS
		etiquetas_requeridas.each {| clave | 
			if @estructura[clave].nil?
				raise EtiquetaInexistenteException.new
			end
		}
	end
end