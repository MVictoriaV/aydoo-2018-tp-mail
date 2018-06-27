require 'rspec'
require_relative '../model/armador_de_etiqueta_time_12'
require_relative '../constantes/constantes_de_fecha'
require_relative '../modules/formateador_fecha'

include ConstantesDeFecha
include FormateadorFecha

describe 'ArmadorDeEtiquetaTime12' do

    fecha_actual = aplicar_formato(ConstantesDeFecha::FORMATO_HORA_12)

    it 'deberia obtener la fecha en el formato DD-MM-YYYY' do
        template = %{<time:12>}
        un_armador = ArmadorDeEtiquetaTime12.new
        
        resultado = un_armador.armar(template)

        resultado_esperado = fecha_actual.to_s

        expect(resultado).to include(resultado_esperado)
    end

    it 'deberia lanzar excepcion de etiqueta time no soportada' do
        template = %{<time:r>}
        un_armador = ArmadorDeEtiquetaTime12.new

        expect{un_armador.comprobar_etiqueta(template)}.to raise_exception(Exception)
    end

    it 'deberia lanzar excepcion de etiqueta time no soportada' do
        template = %{<time:24> y <time:12> }

        un_armador = ArmadorDeEtiquetaTime12.new

        expect{un_armador.comprobar_etiqueta(template)}.to raise_exception(EtiquetaNoSoportadaException)
    end

    it 'deberia realizar un solo reemplazo ya que una etiqueta time no es soportada' do
        template = %{<time:24> y <time:12> }

        un_armador = ArmadorDeEtiquetaTime12.new
        resultado = un_armador.armar(template)
        resultado_esperado = "<time:24> y " + fecha_actual.to_s

        expect(resultado).to include(resultado_esperado)
    end
end