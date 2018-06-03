require_relative 'contacto'
require 'json'

class ParseadorContacto

	def initialize()
    @contactos = Array.new
  end

  def parsear(un_json, un_id)
    contactos = JSON.parse(un_json[un_id].to_json)
    genera_contactos(contactos)
  end


  ##REFACTORIZAR
  def genera_contactos(un_hash)
    contactos_importados = 0
    un_hash.each do |clave, valor|
      otro_hash = clave
      nombre = nil
      apellido = nil
      mail = nil
      if valor.is_a?(::Hash)
        valor.each do |otra_clave, otro_valor|
          if otra_clave == "nombre"
            nombre = otro_valor.to_s
          elsif otra_clave == "apellido"
            apellido = otro_valor.to_s
          else
            mail = otro_valor.to_s
          end
        end
      else
        otro_hash.each do |otra_clave, otro_valor|
          if otra_clave == "nombre"
            nombre = otro_valor.to_s
          elsif otra_clave == "apellido"
            apellido = otro_valor.to_s
          else
            mail = otro_valor.to_s
          end
        end
      end
      crear_contacto(nombre,apellido,mail)
      contactos_importados = contactos_importados + 1
    end
    return contactos_importados
  end

  def crear_contacto(un_nombre,un_apellido,un_mail)
    contacto = Contacto.new(un_nombre,un_apellido,un_mail)
    @contactos.push(contacto)
  end

  def get_contactos()
    return @contactos
  end

end