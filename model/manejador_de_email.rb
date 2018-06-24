require 'json'
require_relative 'procesador_estructural'
require_relative 'email'
require_relative 'enviador_de_mail'

class ManejadorDeEMail

  attr_accessor :email

  def armar_email(punto_de_entrada)
    procesador = ProcesadorEstructural.new
    begin
      procesador.crear_estructura(JSON.parse(punto_de_entrada))
      @email = EMail.new(procesador.estructura)
      @email.cargar_cuerpo_a_contacto
    rescue Exception => e
      raise e
    end
  end

  def enviar
    enviador = EnviadorDeMail.new
    enviador.enviar_mail__(@email)
  end
end