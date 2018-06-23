require_relative 'armador_de_etiqueta_time'
require_relative 'armador_de_etiqueta_sum'
require_relative 'armador_de_etiqueta_empty'
require_relative 'armador_de_etiqueta_date'
require_relative 'armador_de_plantilla'

class ArmadorDeTemplate

    def initialize
        @armadores = [  ArmadorDeEtiquetaDate.new,
                        ArmadorDeEtiquetaTime.new,
                        ArmadorDeEtiquetaEmpty.new,
                        ArmadorDeEtiquetaSum.new,
                        ArmadorDePlantilla.new]
    end

    def armar(plantilla)
        una_plantilla = plantilla
        @armadores.each do |armador|
            una_plantilla = armador.armar(una_plantilla)
        end
        una_plantilla
    end

end