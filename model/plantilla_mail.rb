require 'erb'

class PlantillaMail

  include ERB::Util
  attr_accessor :item, :plantilla

  def initialize(item, plantilla)
    @plantilla = plantilla
    @item = item
  end

  def renderizar
    ERB.new(@plantilla).result(binding)
  end
end