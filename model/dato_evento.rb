class DatoEvento

  attr_accessor :nombre_evento
  attr_accessor :asunto
  attr_accessor :lugar_evento
  attr_accessor :fecha_del_evento
  attr_accessor :Mail_de_confirmacion
  attr_accessor :mail_remitente

  def initialize(mail_remitente,un_asunto, un_nombre, lugar, fecha, mail_confirmacion)
    @mail_remitente = mail_remitente
    @asunto = un_asunto
    @nombre_evento = un_nombre
    @lugar_evento = lugar
    @fecha_del_evento = fecha
    @Mail_de_confirmacion = mail_confirmacion
  end
end