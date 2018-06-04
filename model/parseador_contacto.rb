require_relative 'contacto'
require 'json'

class ParseadorContacto

	def initialize()
    @contactos = Array.new
    @atributos_contacto = Array.new
  end

  def parsear(un_json)
    genera_contactos(un_json)
  end


  ##REFACTORIZAR
  def genera_contactos(un_hash)
    contactos_importados = 0
    un_hash.each do |clave, valor|
      atributos = Array.new
      otro_hash = clave
      nombre = nil
      apellido = nil
      mail = nil
      un_atributo = nil
      
      if valor.is_a?(::Hash)
        un_atributo = retiene_valores(valor, atributos)
      else
        un_atributo = retiene_valores(otro_hash, atributos)
      end
      
      nombre = un_atributo[0]
      apellido = un_atributo[1]
      mail = un_atributo[2]
      
      begin
        crear_contacto(nombre,apellido,mail)
        contactos_importados = contactos_importados + 1
      rescue Exception
        puts 'ERROR EN CONTACTO'
      end
    end
    return contactos_importados
  end

  def retiene_valores (un_hash, atributos)
    atributos.push(un_hash["nombre"])
    atributos.push(un_hash["apellido"])
    atributos.push(un_hash["mail"])
    return atributos
  end

  def crear_contacto(un_nombre,un_apellido,un_mail)
      contacto = Contacto.new(un_nombre,un_apellido,un_mail)
      @contactos.push(contacto)
  end

  def get_contactos()
    return @contactos
  end

end