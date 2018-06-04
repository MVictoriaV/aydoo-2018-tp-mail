require 'rspec'
require_relative '../model/parseador_dato'

class ProcesadorDatoSpec

    describe 'ProcesadorDato' do
    	parseador_dato = ParseadorDato.new

        it 'deberia recibir un hash con la informacion de del evento y deberia devolver true' do
            parametro = { 
            	"asunto": "Invitación a fiesta de fin de año", "nombre_evento": "la cena de fin de año de la UNTREF",
            	"lugar_evento": "el Centro de estudios (avenida Directorio 887, Caseros)",
       			"fecha_del_evento": "5 de diciembre",
       			"Mail_de_confirmacion": "fiesta@untref.com"}
            respuesta_del_parseo = parseador_dato.parsear(parametro)
        	expect(respuesta_del_parseo).to be_truthy
        end
    end
end