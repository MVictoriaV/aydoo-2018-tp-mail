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
		sentencia = asignar_valor_etiqueta_especial(sentencia)
		plantilla_armada = %{ #{sentencia} }.gsub(/[<>]/, '<' => ' <%= @', '>' => ' %>')
        return plantilla_armada
	end


	private
	def inicializar_etiquetas_especiales
		@etiquetas_especiales = {
			'<date:i>' => set_fecha_especial(true), 
			'<date:d>' => set_fecha_especial(false)
		}
	end

	def set_fecha_especial(es_inversa)
		formato_de_fecha = es_inversa ? "%Y-%m-%d" : "%d-%m-%Y"
		fecha_actual = Time.now.strftime(formato_de_fecha)
	end

	def asignar_valor_etiqueta_especial(sentencia)
		nueva_sentencia = sentencia
 		@etiquetas_especiales.each {|etiqueta, valor|
      		nueva_sentencia = nueva_sentencia.gsub(etiqueta, valor)
 		}
      	return nueva_sentencia
	end
 end