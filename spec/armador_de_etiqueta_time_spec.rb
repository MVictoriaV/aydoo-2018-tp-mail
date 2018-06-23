require 'rspec'
require_relative '../model/armador_de_etiqueta_time'

class ArmadorDeEtiquetaTimeSpec

    describe 'ArmadorDeEtiquetaTime' do

        it 'deberia obtener la fecha en el formato 24' do
        	formato_de_fecha = "%H:%M"
          fecha_actual = Time.now.strftime(formato_de_fecha)
          template = %{<time:24>}
          un_armador = ArmadorDeEtiquetaTime.new()
          
          resultado = un_armador.armar(template)
          resultado_esperado = fecha_actual.to_s
          expect(resultado).to include(resultado_esperado)
        end

        it 'deberia obtener la fecha en el formato DD-MM-YYYY' do
          fecha_actual = Time.now.strftime("%R")
          template = %{<time>}
          un_armador = ArmadorDeEtiquetaTime.new()
          
          resultado = un_armador.armar(template)
          resultado_esperado = fecha_actual.to_s
          expect(resultado).to include(resultado_esperado)
        end

        it 'deberia retornar el template original por etiqueta no soportada' do
          template = %{<time:r>}
          un_armador = ArmadorDeEtiquetaTime.new()
          resultado = un_armador.armar(template)
          expect(resultado).to include(template)
        end
    end
end