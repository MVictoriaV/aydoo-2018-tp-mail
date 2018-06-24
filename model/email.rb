require_relative 'parseador_contacto'
require_relative 'punto_entrada_nulo_exception'
require_relative 'asunto_inexistente_exception'
require_relative 'remitente_exception'
require_relative 'armador_de_template'

class EMail

	attr_accessor :contacto_cuerpo_mail
	attr_accessor :remitente
	attr_accessor :asunto

	def initialize(estructura)
		raise PuntoEntradaNuloException if estructura.nil?

		verificar_datos_requeridos(estructura)
		
		@remitente = estructura[:datos]["remitente"]
		@asunto = estructura[:datos]["asunto"]

		parseador = ParseadorContacto.new
		@contactos = parseador.parsear(estructura[:contactos])
		@valores_para_template = estructura[:datos]
		@cuerpo = estructura[:template]
	end

	#Por cada contacto se carga un cuerpo del mail
	def cargar_cuerpo_a_contacto
		@contacto_cuerpo_mail = Hash.new
		armador_template = ArmadorDeTemplate.new

		armador_template.armar(@cuerpo)
		@contactos.each do |item|
			plantilla_completa = preparar_datos_para_template(item.get_nombre, armador_template)
			@contacto_cuerpo_mail[item.get_mail] = plantilla_completa
		end
	end

	private
	attr_accessor :valores_para_template, :contactos, :cuerpo

	def verificar_datos_requeridos(estructura)
		raise RemitenteException if estructura[:datos]["remitente"].nil?
		raise AsuntoInexistenteException if estructura[:datos]["asunto"].nil?
	end

	def preparar_datos_para_template(nombre_contacto, armador_template)
		@valores_para_template["nombre"] = nombre_contacto
		plantilla_completa = armador_template.cargar_valores(@valores_para_template)
		return plantilla_completa
	end
end