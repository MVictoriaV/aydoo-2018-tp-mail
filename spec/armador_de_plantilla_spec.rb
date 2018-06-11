require 'rspec'
require_relative '../model/armador_de_plantilla'

class ArmadorDePlantillaSpec

    describe 'ArmadorDePlantilla' do

        it 'deberia poder reemplazar todas las etiquetas' do
        	formato_de_fecha = "%Y-%m-%d"
          	fecha_actual = Time.now.strftime(formato_de_fecha)

          	formato_de_fecha = "%H:%M"
          	hora_actual = Time.now.strftime(formato_de_fecha)

			template = %{<date:i>  <empty(uruguay,argentina)> <sum(4,3)> <time:24>}
			un_armador = ArmadorDePlantilla.new()

			resultado = un_armador.armar(template)
			resultado_esperado = fecha_actual.to_s + "  uruguay 7 " + hora_actual.to_s
			expect(resultado).to include(resultado_esperado)
        end

        it 'deber3ia reemplazar solamente 3 etiquetas ya que existe una etiqueta no soportada' do

          	formato_de_fecha = "%H:%M"
          	hora_actual = Time.now.strftime(formato_de_fecha)

			template = %{<date:r>  <empty(uruguay,argentina)> <sum(4,3)> <time:24>}
			un_armador = ArmadorDePlantilla.new()

			resultado = un_armador.armar(template)
			resultado_esperado = "<date:r>  uruguay 7 " + hora_actual.to_s
			expect(resultado).to include(resultado_esperado)
        end
    end
end