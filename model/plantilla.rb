class Plantilla

	attr_reader :nombre
	attr_reader :nombre_evento
	attr_reader :lugar_del_evento
	attr_reader :fecha_del_evento
	attr_reader :mail_de_confirmacion
	attr_reader :etiquetas_especiales

	def initialize(nombre, nombre_evento, lugar_del_evento, fecha_del_evento, mail_de_confirmacion)
	    @nombre = nombre
	    @nombre_evento = nombre_evento
	    @lugar_del_evento = lugar_del_evento
	    @fecha_del_evento = fecha_del_evento
	    @mail_de_confirmacion = mail_de_confirmacion
	    @etiquetas_especiales = inicializar_etiquetas_especiales
  	end

	def get_binding
		binding
	end

	def armar_plantilla(sentencia)
		if (contiene_etiqueta_especial?("<date:i>"))
			sentencia = sentencia.gsub('<date:i>', set_fecha_especial(true))
		end
		plantilla_armada = %{ #{sentencia} }.gsub(/[<>]/, '<' => ' <%= @', '>' => ' %>')
        return plantilla_armada
	end

	def contiene_etiqueta_especial?(etiqueta)
		@etiquetas_especiales.include?(etiqueta)
	end

	private
	def inicializar_etiquetas_especiales
		@etiquetas_especiales = ['<date:i>', '<date:d>']
	end

	def set_fecha_especial(es_inversa)
		formato_de_fecha = es_inversa ? "%Y-%m-%d" : "%d-%m-%Y"
		fecha_actual = Time.now.strftime(formato_de_fecha)
	end
 end