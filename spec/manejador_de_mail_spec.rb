require_relative '../model/manejador_de_mail'
require_relative '../model/parseador_json'
require 'yaml'

class ManejadorDeMailSpec

	describe 'ManejadorDeMail' do
		def levantar_archivo_json()
            un_archivo = "json_contactos_datos.txt"
            mi_hash = YAML.load_file(un_archivo)
            return mi_hash.to_json
        end

		it 'mock deberia invocar al metodo enviar' do
  			un_json = levantar_archivo_json()
  			manejador = double
            manejador.stub(:enviar).and_return(true)
		end

		it 'mock deberia enviar mails' do
  			manejador = double
  			un_json = levantar_archivo_json()
            parseador_json = ParseadorJson.new
		    parseador_json.parsear(un_json)
		    datos_del_mail = parseador_json.get_dato
		    template = parseador_json.get_cuerpo_mail
		    manejador.stub(:enviar).with(datos_del_mail, template).and_return(true)
		end
	end
end