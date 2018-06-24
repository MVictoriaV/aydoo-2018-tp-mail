require_relative 'procesador_estructural'
require_relative 'email'
require 'json'

class ManejadorDeEMail

  def armar_email(punto_de_entrada)
    procesador = ProcesadorEstructural.new
    begin
      procesador.crear_estructura(JSON.parse(punto_de_entrada))
    rescue Exception => e
      return nil
    end
    mail = EMail.new(procesador.estructura)
    return mail
  end

  def enviar(email)
    return !email.nil?
  end
end