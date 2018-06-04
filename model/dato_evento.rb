class DatoEvento

  attr_accessor :asunto
  attr_accessor :nombre
  attr_accessor :lugar
  attr_accessor :fecha
  attr_accessor :mail_de_confirmacion

  def initialize(un_asunto, un_nombre, lugar, fecha, mail)
    @asunto = un_asunto
    @nombre = un_nombre
    @lugar = lugar
    @fecha = fecha
    @mail_de_confirmacion = mail
  end
end