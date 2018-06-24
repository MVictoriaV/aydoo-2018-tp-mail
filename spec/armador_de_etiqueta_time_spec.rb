require 'rspec'
require_relative '../model/armador_de_etiqueta_time'
require_relative '../constantes/constantes_de_fecha'
require_relative '../modules/formateador_fecha'

include ConstantesDeFecha
include FormateadorFecha

describe 'ArmadorDeEtiquetaTime' do

    it 'deberia obtener la fecha en el formato 24' do
      	fecha_actual = aplicar_formato(ConstantesDeFecha::FORMATO_HORA_24)

        template = %{<time>}
        un_armador = ArmadorDeEtiquetaTime.new()
        
        resultado = un_armador.armar(template)
        resultado_esperado = fecha_actual.to_s
        expect(resultado).to include(resultado_esperado)
    end
end