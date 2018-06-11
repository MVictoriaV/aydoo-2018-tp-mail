class EsquemaPlantilla

  attr_reader :nombre
  attr_reader :nombre_evento
  attr_reader :lugar_evento
  attr_reader :fecha_del_evento
  attr_reader :mail_de_confirmacion

  def initialize(nombre, datos_generales)
    @nombre = nombre
    @nombre_evento = datos_generales.nombre_evento
    @lugar_evento = datos_generales.lugar_evento
    @fecha_del_evento = datos_generales.fecha_del_evento
    @mail_de_confirmacion = datos_generales.mail_de_confirmacion
  end

  def get_binding
    binding
  end
end