require 'rspec'
require_relative '../model/parseador_json'

class ParseadorJsonSpec

    describe 'ParseadorJson' do
    	parseador_json = ParseadorJson.new

        it 'deberia recibir un json por parametro y devolver true' do
            respuesta = parseador_json.parsear('{ "template":"Hola <nombre>," }')
        	expect(respuesta).to be_truthy
        end

        it 'debe lanzar excepcion si el json es es nil' do
          expect{ parseador_json.parsear(nil) }.to raise_exception(ExcepcionParseador)
        end
    end
end