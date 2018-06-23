require_relative 'procesador_estructural'
require_relative 'email'
require 'json'

class ManejadorDeEMail

  def armar_email(punto_de_entrada)
    procesador = ProcesadorEstructural.new
    procesador.crear_estructura(JSON.parse(punto_de_entrada))
    mail = EMail.new(procesador.estructura)
    return mail
  end
end