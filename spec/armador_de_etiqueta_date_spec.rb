require 'rspec'
require_relative '../model/armador_de_etiqueta_date'

class ArmadorDeEtiquetaDateSpec

    describe 'ArmadorDeEtiquetaDate' do

        it 'deberia obtener la fecha en el formato YYYY-MM-DD' do
        	formato_de_fecha = "%Y-%m-%d"
			fecha_actual = Time.now.strftime(formato_de_fecha)
          	template = %{<date:i>}
          	un_armador = ArmadorDeEtiquetaDate.new()
          
			resultado = un_armador.armar(template)
			resultado_esperado = fecha_actual.to_s
			expect(resultado).to include(resultado_esperado)
        end

        it 'deberia obtener la fecha en el formato DD-MM-YYYY' do
        	formato_de_fecha = "%d-%m-%Y"
			fecha_actual = Time.now.strftime(formato_de_fecha)
          	template = %{<date:d>}
          	un_armador = ArmadorDeEtiquetaDate.new()
          
			resultado = un_armador.armar(template)
			resultado_esperado = fecha_actual.to_s
			expect(resultado).to include(resultado_esperado)
        end

        it 'deberia ser nil etiqueta no soportada' do
          	template = %{<date:r>}
          	un_armador = ArmadorDeEtiquetaDate.new()
			resultado = un_armador.armar(template)
			expect(resultado).to eq nil
        end
    end
end