require 'rspec'
require 'json'
require_relative '../model/validador_de_etiqueta'

class ValidadorDeEtiquetaSpec

    describe 'ValidadorDeEtiqueta' do

        validador_de_etiquetas = ValidadorDeEtiqueta.new
        parametro_json = File.read("./archivos_de_prueba/datos_prueba1.json")

        it 'deberia retornar true al validar que las etiquetas requeridas las tiene' do

          etiquetas_requeridas = [
                              "remitente", 
                              "asunto", 
                              "nombre_evento", 
                              "lugar_evento", 
                              "fecha_del_evento", 
                              "mail_de_confirmacion"]
          hash_gral = JSON.parse(parametro_json)
          esta_ok = validador_de_etiquetas.validar(etiquetas_requeridas, hash_gral['datos'])
          expect(esta_ok).to be_truthy
        end
    end
end