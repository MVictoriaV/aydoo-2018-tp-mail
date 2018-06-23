require 'rspec'
require_relative '../model/esquema_plantilla'
require_relative '../model/plantilla_mail'

class PlantillaMailSpec

    describe 'PlantillaMail' do

        it 'deberia obtener la plantilla con los datos del evento' do
          template = "Hola <%=item.nombre%>,\n\r Por medio del presente mail te estamos invitando a <%=item.nombre_evento%>, que se desarrollará en <%=item.lugar_evento%>, el día <%=item.fecha_del_evento%>. Por favor confirmar su participación enviando un mail a <%=item.mail_de_confirmacion%>.\n\rSin otro particular.La direccion"
          dato_hash = {nombre_evento: "Fiesta Z", lugar_evento: "mi casa", fecha_del_evento: "23 de Dic. 2018", mail_de_confirmacion: "mi_fiesta@ejemplo.com"}
          datos_grales = OpenStruct.new(dato_hash)
          
          datos_de_la_plantilla = EsquemaPlantilla.new("Pepe", datos_grales)
          plantilla = PlantillaMail.new(datos_de_la_plantilla, template)
          
          resultado_mail = plantilla.renderizar()
          resultado_esperado = "Hola Pepe,\n\r Por medio del presente mail te estamos invitando a Fiesta Z, que se desarrollará en mi casa, el día 23 de Dic. 2018. Por favor confirmar su participación enviando un mail a mi_fiesta@ejemplo.com.\n\rSin otro particular.La direccion"

          expect(resultado_mail).to include(resultado_esperado)
        end
    end
end