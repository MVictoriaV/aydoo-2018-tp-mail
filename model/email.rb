require_relative 'parseador_contacto'
require_relative 'punto_entrada_nulo_exception'
require_relative 'remitente_exception'

class EMail

	attr_accessor :remitente
	attr_accessor :contactos
	attr_accessor :asunto
	attr_accessor :cuerpo

	def initialize(estructura)
		raise PuntoEntradaNuloException if estructura.nil?

		verificar_datos_requeridos(estructura)
		
		@remitente = estructura[:datos]["remitente"]
		parseador = ParseadorContacto.new
		@contactos = parseador.parsear(estructura[:contactos])
		@asunto = estructura[:datos]["asunto"]
		@cuerpo = "cuerpo"
	end

	private
	def verificar_datos_requeridos(estructura)
		raise RemitenteException if estructura[:datos]["remitente"].nil?
	end
end