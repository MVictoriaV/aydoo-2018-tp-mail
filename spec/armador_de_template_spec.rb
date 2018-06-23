require_relative '../model/armador_de_template'
require 'rspec'

describe 'ArmadorDeTemplate' do
	

    un_armador = ArmadorDeTemplate.new

    it 'deberia reemplazar la totalidad de las etiquetas' do
    	formato_de_fecha = "%Y-%m-%d"
        fecha_actual = Time.now.strftime(formato_de_fecha)

        formato_de_fecha = "%H:%M"
        hora_actual = Time.now.strftime(formato_de_fecha)

        template = %{<date:i>  <empty(uruguay,argentina)> <sum(4,3)> <time:24>}

        resultado = un_armador.armar(template)
        resultado_esperado = fecha_actual.to_s + "  uruguay 7 " + hora_actual.to_s

        expect(resultado).to include(resultado_esperado)
    end

    it 'deberia reemplazar solamente 4 etiquetas ya que existe una etiqueta no soportada' do

        formato_de_fecha = "%H:%M"
        hora_actual = Time.now.strftime(formato_de_fecha)

        template = %{Hola <nombre> <date:r>  <empty(uruguay,argentina)> <sum(4,3)> <time:24>}
        resultado = un_armador.armar(template)
        resultado_esperado = "Hola <%=@item.nombre%> <date:r>  uruguay 7 " + hora_actual.to_s
        expect(resultado).to include(resultado_esperado)
    end
end