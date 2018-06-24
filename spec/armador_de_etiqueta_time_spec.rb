require 'rspec'
require_relative '../model/armador_de_etiqueta_time'

class ArmadorDeEtiquetaTimeSpec

    describe 'ArmadorDeEtiquetaTime' do

        it 'deberia obtener la fecha en el formato 24' do
          	fecha_actual = Time.now.strftime("%R")
            template = %{<time>}
            un_armador = ArmadorDeEtiquetaTime.new()
            
            resultado = un_armador.armar(template)
            resultado_esperado = fecha_actual.to_s
            expect(resultado).to include(resultado_esperado)
        end

        it 'deberia obtener la fecha en el formato DD-MM-YYYY' do
            formato_de_fecha = "%H:%M"
            fecha_actual = Time.now.strftime(formato_de_fecha)
            template = %{<time:12>}
            un_armador = ArmadorDeEtiquetaTime.new()
            
            resultado = un_armador.armar(template)
            resultado_esperado = fecha_actual.to_s
            expect(resultado).to include(resultado_esperado)
        end

        it 'deberia lanzar excepcion de etiqueta time no soportada' do
            template = %{<time:r>}
            un_armador = ArmadorDeEtiquetaTime.new()
            expect{un_armador.comprobar_etiqueta(template)}.to raise_exception(Exception)
        end

        it 'deberia lanzar excepcion de etiqueta time no soportada' do
            template = %{<time:24> y <time> }
            fecha_actual = Time.now.strftime("%R")
            un_armador = ArmadorDeEtiquetaTime.new()
            expect{un_armador.comprobar_etiqueta(template)}.to raise_exception(EtiquetaNoSoportadaException)
        end

        it 'deberia realizar un solo reemplazo ya que una etiqueta time no es soportada' do
            template = %{<time:24> y <time> }
            fecha_actual = Time.now.strftime("%R")
            un_armador = ArmadorDeEtiquetaTime.new()
            resultado = un_armador.armar(template)
            resultado_esperado = "<time:24> y " + fecha_actual.to_s
            expect(resultado).to include(resultado_esperado)
        end
    end
end