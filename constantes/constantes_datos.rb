module Constantes

	ETIQUETAS_REQUERIDAS = ["template", "contactos", "datos"].freeze

	def constantes_requeridas
		constantes_requeridas = [
				"template",
                "contactos",
                "datos"]
	end

	def get_constantes_datos
		constantes_datos = [
				"remitente", 
				"asunto", 
				"nombre_evento", 
				"lugar_evento", 
				"fecha_del_evento", 
				"mail_de_confirmacion"]
	end

	def get_constantes_contactos
		constantes_contactos = [
				"nombre", 
				"apellido",
				"mail"
		]
	end
end