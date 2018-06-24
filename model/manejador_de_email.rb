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
      @email = nil
      raise e
    end
    return @email.nil?
  end

  def enviar
    begin
      enviador = EnviadorDeMail.new
      enviador.enviar_mail(@email)
    rescue Exception => e
      puts e
      raise e
    end
  end
end