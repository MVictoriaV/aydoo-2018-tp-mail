require 'rspec'
require 'yaml'
require_relative '../model/parseador_json'

class ParseadorJsonSpec

    describe 'ParseadorJson' do
    	parseador_json = ParseadorJson.new

        def levantar_archivo_json()
            un_archivo = "json_contactos_datos.txt"
            mi_hash = YAML.load_file(un_archivo)
            return mi_hash.to_json
        end

        it 'deberia recibir un json por parametro y devolver true' do
            respuesta = parseador_json.parsear('{ "template":"Hola <nombre>," }')
        	expect(respuesta).to be_truthy
        end

        it 'debe lanzar excepcion si el json es es nil' do
          expect{ parseador_json.parsear(nil) }.to raise_exception(ExcepcionParseador)
        end

        it 'asd' do
            un_json = levantar_archivo_json()
            parseador_json.parsear(un_json)
        end
    end
end