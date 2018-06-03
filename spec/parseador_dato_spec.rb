require 'rspec'
require_relative '../model/parseador_dato'

class ProcesadorDatoSpec

    describe 'ProcesadorDato' do
    	parseador_dato = ParseadorDato.new

        it 'deberia recibir un hash con la informacion de del evento y deberia devolver true' do
            parametro = { "asunto": "Invitación a fiesta de fin de año", "nombre_evento": "la cena de fin de año de la UNTREF"}
            respuesta_del_parseo = parseador_dato.parsear(parametro)
        	expect(respuesta_del_parseo).to be_truthy
        end
    end
end