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

        it 'deberia retornar la etiqueta sin reemplazo porque primer argumento no es un numero' do
            template = %{<sum(a,3)>}
            un_armador = ArmadorDeEtiquetaSum.new()
            resultado = un_armador.armar(template)
            expect(resultado).to include(template)
        end

        it 'deberia retornar ka etiqueta sin reemplazo porque segundo argumento no es un numero' do
            template = %{<sum(1,a)>}
            un_armador = ArmadorDeEtiquetaSum.new()
            resultado = un_armador.armar(template)
            expect(resultado).to include(template)
        end

        it 'deberia lanzar excepcion de etiqueta sum numero y letra no soportada' do
            template = %{<sum(1,a)>}
            un_armador = ArmadorDeEtiquetaSum.new()
            expect{un_armador.comprobar_etiqueta(template)}.to raise_exception(Exception)
        end

        it 'deberia lanzar excepcion de etiqueta sum letra y letra no soportada' do
            template = %{<sum(b,a)>}
            un_armador = ArmadorDeEtiquetaSum.new()
            expect{un_armador.comprobar_etiqueta(template)}.to raise_exception(Exception)
        end

        it 'deberia lanzar excepcion de etiqueta sum numero y nulo no soportada' do
            template = %{<sum(1,nil)>}
            un_armador = ArmadorDeEtiquetaSum.new()
            expect{un_armador.comprobar_etiqueta(template)}.to raise_exception(Exception)
        end
    end
end