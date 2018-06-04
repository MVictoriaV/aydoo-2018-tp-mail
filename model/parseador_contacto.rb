require_relative 'contacto'
require 'json'

class ParseadorContacto

	def initialize()
    @contactos = Array.new
    @atributos_contacto = Array.new
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
          retiene_valores (valor)
      else
        otro_hash.each do ||
          retiene_valores (otro_hash)
        end
      end
      nombre = @atributos_contacto[0]
      apellido = @atributos_contacto[1]
      mail = @atributos_contacto[2]
      crear_contacto(nombre,apellido,mail)
      contactos_importados = contactos_importados + 1
    end
    return contactos_importados
  end

  def retiene_valores (un_hash)
    @atributos_contacto.push(un_hash["nombre"])
    @atributos_contacto.push(un_hash["apellido"])
    @atributos_contacto.push(un_hash["mail"])
  end

  def crear_contacto(un_nombre,un_apellido,un_mail)
    contacto = Contacto.new(un_nombre,un_apellido,un_mail)
    @contactos.push(contacto)
  end

  def get_contactos()
    return @contactos
  end

end