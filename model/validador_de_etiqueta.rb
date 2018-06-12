require 'json'

class ExcepcionEtiqueta < StandardError

	attr_reader :object
	def initialize(object)
		@object = object
	end
end

class ValidadorDeEtiqueta

	def validar(etiquetas_requeridas, etiquetas_a_validar)

		if etiquetas_a_validar.nil?
			raise ExcepcionEtiqueta.new(self), 'Etiqueta nula'
		end
		un_hash = JSON.parse(etiquetas_a_validar.to_json)
		etiquetas_requeridas.each { |item| 
			unless un_hash.has_key?(item)
				puts 'hubo una etiqueta que no estaba'
				raise ExcepcionEtiqueta.new(self), 'Etiqueta no contenida'
			end
		}
		return true
	end
end