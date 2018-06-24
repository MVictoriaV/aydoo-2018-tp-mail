require 'rspec'
require_relative '../model/armador_de_template'
require_relative '../constantes/constantes_de_fecha'
require_relative '../modules/formateador_fecha'

include ConstantesDeFecha
include FormateadorFecha

describe 'ArmadorDeTemplate' do

    un_armador = ArmadorDeTemplate.new

    it 'deberia reemplazar la totalidad de las etiquetas' do
    	formato_de_fecha = "%Y-%m-%d"
        fecha_actual = Time.now.strftime(formato_de_fecha)

        formato_de_fecha = "%H:%M"
        hora_actual = aplicar_formato(ConstantesDeFecha::FORMATO_HORA_12)

        template = %{<date:i>  <empty(uruguay,argentina)> <sum(4,3)> <time:12>}

        un_armador.armar(template)
        resultado_esperado = fecha_actual.to_s + "  uruguay 7 " + hora_actual.to_s

        expect(un_armador.plantilla).to include(resultado_esperado)
    end

    it 'deberia reemplazar solamente 4 etiquetas ya que existe una etiqueta no soportada' do

        formato_de_fecha = "%H:%M"
        hora_actual = Time.now.strftime(formato_de_fecha)
        hora_actual = Time.now.strftime("%R")

        template = %{Hola <nombre> <date:r>  <empty(uruguay,argentina)> <sum(4,3)> <time>}
        un_armador.armar(template)
        resultado_esperado = "Hola <%=nombre%> <date:r>  uruguay 7 " + hora_actual.to_s
        
        expect(un_armador.plantilla).to include(resultado_esperado)
    end

    it 'deberia cargar valores en la plantilla' do
        
        un_armador.plantilla = "Hola <%=nombre%>. Te estamos invitamos a <%=nombre_evento%>"
        plantilla_esperada = "Hola Matias. Te estamos invitamos a AyDOO"

        valores = OpenStruct.new({nombre: 'Matias', nombre_evento: 'AyDOO'})
        plantilla_resultado = un_armador.cargar_valores(valores)

        expect(plantilla_resultado).to include(plantilla_esperada)
    end
end