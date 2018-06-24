require_relative 'armador_de_etiqueta_time'
require_relative 'armador_de_etiqueta_sum'
require_relative 'armador_de_etiqueta_empty'
require_relative 'armador_de_etiqueta_date'
require_relative 'armador_de_plantilla'
require 'erb'

class ArmadorDeTemplate

    attr_accessor :plantilla

    def initialize
        @armadores = [  ArmadorDeEtiquetaDate.new,
                        ArmadorDeEtiquetaTime.new,
                        ArmadorDeEtiquetaEmpty.new,
                        ArmadorDeEtiquetaSum.new,
                        ArmadorDePlantilla.new]
    end

    def armar(plantilla)
        @plantilla = plantilla
        @armadores.each do |armador|
            @plantilla = armador.armar(@plantilla)
        end
        @plantilla
    end

    def cargar_valores(valores)
      ERB.new(@plantilla).result(OpenStruct.new(valores).instance_eval { binding })
    end
end