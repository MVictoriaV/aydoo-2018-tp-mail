class EMail

	attr_accessor :remitente
	attr_accessor :contactos
	attr_accessor :asunto
	attr_accessor :cuerpo

	def initialize(estructura)
		@asunto = estructura[:datos]["asunto"]
		@remitente = estructura[:datos]["remitente"]
	end
end