require 'json'

module ValidadorDeDatos

	def validar(parametros)
		un_hash = JSON.parse(parametros.to_json)
		etiquetas_requeridas = inicializar_etiquetas
		etiquetas_requeridas.each { |item| 
			unless un_hash.has_key?(item)
				return false
			end
		}
		return true
	end

	private
	def inicializar_etiquetas
		return datos = [
			"remitente", 
			"asunto", 
			"nombre_evento", 
			"lugar_evento", 
			"fecha_del_evento", 
			"mail_de_confirmacion"]
	end
end