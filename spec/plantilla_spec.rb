require_relative '../model/esquema_plantilla'
require_relative '../model/plantilla'

class PlantillaSpec

    describe 'Plantilla' do
    	
        un_esquema = EsquemaPlantilla.new("Juan", "cena UNTREF", "Bs. As.", "1 de Mayo", "pepe@ejemplo.com")
        it 'se espera que inyecte los parametros en la plantilla' do
            mi_plantilla = Plantilla.new(un_esquema)
            valor_del_template = 'Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion'
            valor_a_mostrar = mi_plantilla.armar_plantilla(valor_del_template)

            rhtml = ERB.new(valor_a_mostrar)
            rhtml.run(mi_plantilla.get_binding)
        end

        it 'se espera que inyecte los parametros con una etiqueta especial en la plantilla' do

            mi_plantilla = Plantilla.new(un_esquema)
            valor_del_template = 'Hola <nombre>,\n\r Hoy es <date:i>'
            valor_a_mostrar = mi_plantilla.armar_plantilla(valor_del_template)

            rhtml = ERB.new(valor_a_mostrar)
            rhtml.run(mi_plantilla.get_binding)
        end

        it 'se espera que inyecte los parametros con dos etiqueta especial en la plantilla' do

            mi_plantilla = Plantilla.new(un_esquema)
            valor_del_template = 'Hola <nombre>,\n\r Hoy es directo <date:d> o inverso <date:i> '
            valor_a_mostrar = mi_plantilla.armar_plantilla(valor_del_template)

            rhtml = ERB.new(valor_a_mostrar)
            rhtml.run(mi_plantilla.get_binding)
        end
    end
end