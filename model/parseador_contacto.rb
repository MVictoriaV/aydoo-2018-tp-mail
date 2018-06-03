require_relative 'contacto'

class ParseadorContacto

	def initialize()

  end

  def parsear(una_linea)
    array_de_palabras = una_linea.split(/\s*,\s*/)
    return array_de_palabras[0]
  end

end