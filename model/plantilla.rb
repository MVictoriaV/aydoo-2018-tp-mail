class Plantilla

	attr_reader :nombre
	attr_reader :nombre_evento
	attr_reader :lugar_del_evento
	attr_reader :fecha_del_evento
	attr_reader :mail_de_confirmacion

	def initialize(nombre, nombre_evento, lugar_del_evento, fecha_del_evento, mail_de_confirmacion)
	    @nombre = nombre
	    @nombre_evento = nombre_evento
	    @lugar_del_evento = lugar_del_evento
	    @fecha_del_evento = fecha_del_evento
	    @mail_de_confirmacion = mail_de_confirmacion
  	end

	def get_binding
		binding
	end

	def armar_plantilla(valor)
		plantilla_armada = %{ #{valor} }.gsub(/[<>]/, '<' => ' <%= @', '>' => ' %>')
        return plantilla_armada
	end
 end