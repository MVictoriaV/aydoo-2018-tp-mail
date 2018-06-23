require 'rspec'
require_relative '../model/armador_de_etiqueta_sum'

class ArmadorDeEtiquetaSumSpec

    describe 'ArmadorDeEtiquetaSum' do

        it 'deberia obtener el resultado de la suma' do
          template = %{<sum(4,3)>}
          un_armador = ArmadorDeEtiquetaSum.new()
          resultado = un_armador.armar(template)
          expect(resultado).to include("7")
        end

        it 'deberia retornar nil porque primer argumento no es un numero' do
          template = %{<sum(a,3)>}
          un_armador = ArmadorDeEtiquetaSum.new()
          resultado = un_armador.armar(template)
          expect(resultado).to include(template)
        end

        it 'deberia retornar nil porque segundo argumento no es un numero' do
          template = %{<sum(1,a)>}
          un_armador = ArmadorDeEtiquetaSum.new()
          resultado = un_armador.armar(template)
          expect(resultado).to include(template)
        end
    end
end