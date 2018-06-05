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

        it 'debe lanzar excepcion si el json incompleto' do
          expect{ parseador_json.parsear('{ "template":"Hola <nombre>," }') }.to raise_exception(ExcepcionParseador)
        end

        it 'debe lanzar excepcion si el json es nil' do
          expect{ parseador_json.parsear(nil) }.to raise_exception(ExcepcionParseador)
        end

        it 'deberia obtener un resultado ok' do
            un_json = levantar_archivo_json()
            json_ok = {"resultado": "ok"}
            expect(parseador_json.parsear(un_json)).to include(json_ok)
        end

        it 'deberia obtener un array de 5 contactos' do
            un_json = levantar_archivo_json()
            parseador_json.parsear(un_json)
            contactos = parseador_json.get_contactos
            expect(contactos.size).to eq 5
        end
    end
end