require_relative 'contacto'

class ParseadorContacto

	def initialize()

  end

  def parsear(una_linea)
    array_de_palabras = una_linea.split(/\s*,\s*/)
    return array_de_palabras[0]
  end

  def levantar_lista_de_contactos(un_archivo)
    contactos_importados = 0
    File.open(un_archivo, "r") do |f|
      f.each_line do |una_linea|
        puts parsear(una_linea)
        contactos_importados = contactos_importados + 1
      end
    end
    return contactos_importados
  end

end