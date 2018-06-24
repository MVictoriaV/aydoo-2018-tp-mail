require_relative 'contacto'
require 'json'

class ParseadorContacto

  attr_accessor :contactos

	def initialize
    @contactos = Array.new
  end

  def parsear(un_hash_de_contactos)
    un_hash_de_contactos.each do |item|
      begin
        crear_contacto(item["nombre"], item["apellido"], item["mail"])
      rescue Exception => msg
        puts msg.message
      end
    end
  end

  def crear_contacto(nombre, apellido, email)
      contacto = Contacto.new(nombre, apellido, email)
      @contactos.push(contacto)
  end
end