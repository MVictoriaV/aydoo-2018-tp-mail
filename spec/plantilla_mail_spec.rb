require 'rspec'
require_relative '../model/datos_del_mail'
require_relative '../model/plantilla_mail'

class PlantillaMailSpec

    describe 'PlantillaMail' do

        it 'deberia obtener la plantilla con los datos del evento' do
          template = %{Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion}
          datos_de_la_plantilla = DatosDelMail.new("Pepe", "Fiesta Z", "mi casa", "23 de Dic. 2018", "mi_fiesta@ejemplo.com")
          plantilla = PlantillaMail.new(datos_de_la_plantilla, template)
          
          resultado_mail = plantilla.renderizar()
          resultado_esperado = "Hola Pepe,\n\r Por medio del presente mail te estamos invitando a Fiesta Z, que se desarrollará en mi casa, el día 23 de Dic. 2018. Por favor confirmar su participación enviando un mail a mi_fiesta@ejemplo.com.\n\rSin otro particular.La direccion"

          expect(resultado_mail).to include(resultado_esperado)
        end
    end
end