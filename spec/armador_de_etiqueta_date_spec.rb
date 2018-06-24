require 'rspec'
require_relative '../model/armador_de_etiqueta_date'
require_relative '../constantes/constantes_de_fecha'
require_relative '../modules/formateador_fecha'

include ConstantesDeFecha
include FormateadorFecha

describe 'ArmadorDeEtiquetaDate' do

    it 'deberia obtener la fecha en el formato YYYY-MM-DD' do
        fecha_actual = aplicar_formato(ConstantesDeFecha::FORMATO_FECHA_INVERTIDA)

        template = %{<date:i>}
        un_armador = ArmadorDeEtiquetaDate.new()

        resultado = un_armador.armar(template)
        resultado_esperado = fecha_actual.to_s
        expect(resultado).to include(resultado_esperado)
    end

    it 'deberia obtener la fecha en el formato DD-MM-YYYY' do
        fecha_actual = aplicar_formato(ConstantesDeFecha::FORMATO_FECHA)
        template = %{<date:d>}
        un_armador = ArmadorDeEtiquetaDate.new()

        resultado = un_armador.armar(template)
        resultado_esperado = fecha_actual.to_s
        expect(resultado).to include(resultado_esperado)
    end

    it 'deberia retornar el template original por etiqueta no soportada' do
        template = %{<date:r>}
        un_armador = ArmadorDeEtiquetaDate.new()
        resultado = un_armador.armar(template)
        expect(resultado).to include(template)
    end

    it 'deberia lanzar excepcion de etiqueta date no soportada' do
        template = %{<date:r>}
        un_armador = ArmadorDeEtiquetaDate.new()
        expect{un_armador.comprobar_etiqueta(template)}.to raise_exception(EtiquetaNoSoportadaException)
    end

    it 'deberia realizar un solo reemplazo ya que una etiqueta date no es soportada' do
        fecha_actual = aplicar_formato(ConstantesDeFecha::FORMATO_FECHA)
        template = %{<date:r> y <date:d> }
        un_armador = ArmadorDeEtiquetaDate.new()
        resultado = un_armador.armar(template)
        resultado_esperado = "<date:r> y " + fecha_actual.to_s
        expect(resultado).to include(resultado_esperado)
    end
end