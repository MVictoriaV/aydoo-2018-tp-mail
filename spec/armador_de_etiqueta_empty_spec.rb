require 'rspec'
require_relative '../model/armador_de_etiqueta_empty'

class ArmadorDeEtiquetaEmptySpec

    describe 'ArmadorDeEtiquetaEmpty' do

        it 'deberia obtener el primer argumento de la funcion empty' do
          template = %{<empty(uruguay,argentina)>}
          un_armador = ArmadorDeEtiquetaEmpty.new()
          resultado = un_armador.armar(template)
          expect(resultado).to include('uruguay')
        end

        it 'deberia obtener el segundo argumento de la funcion empty' do
          template = %{<empty(nil,argentina)>}
          un_armador = ArmadorDeEtiquetaEmpty.new()
          resultado = un_armador.armar(template)
          expect(resultado).to include('argentina')
        end
    end
end