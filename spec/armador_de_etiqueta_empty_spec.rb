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
            template = %{<empty(pais,argentina)>}
            un_armador = ArmadorDeEtiquetaEmpty.new()
            resultado = un_armador.armar(template)
            expect(resultado).to include('argentina')
        end

        it 'deberia lanzar excepcion ya que ambos argumentos de la etiqueta empty son nulos' do
            template = %{<empty(nil,nil)>}
            un_armador = ArmadorDeEtiquetaEmpty.new()
            expect{un_armador.armar(template)}.to raise_exception(EtiquetaEmptyConReemplazosNulosException)
        end

        it 'deberia lanzar excepcion ya que el primer argumento de la etiqueta empty es nulo' do
            template = %{<empty(nil,argentina)>}
            un_armador = ArmadorDeEtiquetaEmpty.new()
            expect{un_armador.armar(template)}.to raise_exception(EtiquetaEmptyConPrimerArgumentoNuloException)
        end

        it 'deberia lanzar excepcion ya que el segundo argumento de la etiqueta empty es nulo' do
            template = %{<empty(uruguay,nil)>}
            un_armador = ArmadorDeEtiquetaEmpty.new()
            expect{un_armador.armar(template)}.to raise_exception(EtiquetaEmptyConSegundoArgumentoNuloException)
        end

    end
end