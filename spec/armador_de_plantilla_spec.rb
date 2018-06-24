require 'rspec'
require_relative '../model/armador_de_plantilla'

describe 'ArmadorDePlantilla' do

    it 'deberia poder reemplazar todas las etiquetas' do
        template = "Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion"
        template_final = "Hola <%=nombre%>,\n\r Por medio del presente mail te estamos invitando a <%=nombre_evento%>, que se desarrollará en <%=lugar_evento%>, el día <%=fecha_del_evento%>. Por favor confirmar su participación enviando un mail a <%=mail_de_confirmacion%>.\n\rSin otro particular.La direccion"
        un_armador = ArmadorDePlantilla.new()

        resultado = un_armador.armar(template)
        expect(resultado).to include(template_final)
    end
end