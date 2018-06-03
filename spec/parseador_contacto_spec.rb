require_relative '../model/parseador_contacto'
require 'yaml'

class ParseadorContactoSpec


    describe 'ParseadorContacto' do
        
        mi_parseador = ParseadorContacto.new()
        un_archivo = "json_contactos_datos.txt"
        def levantar_archivo_json(un_archivo, un_id)
            mi_hash = YAML.load_file(un_archivo)
        end

        it 'deberia importar todos los contactos de la lista' do
            expect(mi_parseador.parsear(levantar_archivo_json(un_archivo, "contactos"), "contactos")).to eq 5
        end

        it 'deberia poder generar un contacto' do
            un_json = {"contactos":{"nombre": "kimi","apellido": "raikkonen","mail": "kimi.raikkonen@unmail.com"}}
            un_contacto = JSON.parse(un_json.to_json)
            expect(mi_parseador.genera_contactos(un_contacto)).to eq 1
        end

        it 'deberia tener un array de 5 contactos' do
            un_parseador = ParseadorContacto.new()
            un_parseador.parsear(levantar_archivo_json(un_archivo, "contactos"), "contactos")
            expect(un_parseador.get_contactos().size).to eq 5
        end
    end
end