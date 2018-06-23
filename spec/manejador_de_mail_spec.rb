require_relative '../model/manejador_de_mail'
require_relative '../model/parseador_json'
require 'yaml'
require 'rspec'

class ManejadorDeMailSpec

	describe 'ManejadorDeMail' do
		def levantar_archivo_json()
            un_archivo = "json_contactos_datos.txt"
            mi_hash = YAML.load_file(un_archivo)
            return mi_hash.to_json
        end

        def levantar_archivo_json_erroneo()
            un_archivo = "./archivos_de_prueba/data2_esquema_incorrecto.json"
            mi_hash = YAML.load_file(un_archivo)
            return mi_hash.to_json
        end

        it 'deberia armar la estructura del mail con los contactos y los datos del evento' do
        	un_manejador = ManejadorDeMail.new(levantar_archivo_json())
        	resultado = un_manejador.armar_estructura_del_mail
        	json_ok = {"resultado": "ok"}
            expect(resultado).to include(json_ok)
        end

        it 'deberia retornar un json de error' do
        	un_manejador = ManejadorDeMail.new(levantar_archivo_json_erroneo())
        	resultado = un_manejador.armar_estructura_del_mail
            expect(resultado).to eq nil
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