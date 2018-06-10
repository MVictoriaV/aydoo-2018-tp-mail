require 'erb'
require_relative 'armador_de_plantilla'

class PlantillaMail

  include ERB::Util
  attr_accessor :item, :plantilla

  def initialize(item, plantilla)
    @item = item
    @plantilla = obtener_plantilla_con_formato(plantilla)
  end

  def renderizar()
    ERB.new(@plantilla).result(binding)
  end

  private
  def obtener_plantilla_con_formato(plantilla)
  	armador = ArmadorDePlantilla.new
  	plantilla_formateada = armador.armar(plantilla)
  	return plantilla_formateada
  end
end