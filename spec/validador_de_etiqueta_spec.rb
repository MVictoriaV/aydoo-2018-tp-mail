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

        it 'deberia lanzar una excepcion al no contener una etiqueta de las requeridas' do

          etiquetas_requeridas = [
                              "remitente", 
                              "asunto_", 
                              "nombre_evento", 
                              "lugar_evento", 
                              "fecha_del_evento", 
                              "mail_de_confirmacion"]
          hash_gral = JSON.parse(parametro_json)

          expect{
                validador_de_etiquetas.validar(etiquetas_requeridas, hash_gral['datos'])
          }.to raise_exception(ExcepcionEtiqueta)
        end

        it 'retorna true al validar que el json contenga las 3 etiquetas requeridas template, contactos y datos' do

          etiquetas_requeridas = [
                              "template",
                              "contactos",
                              "datos"]
          hash_gral = JSON.parse(parametro_json)
          
          esta_ok = validador_de_etiquetas.validar(etiquetas_requeridas, hash_gral)
          expect(esta_ok).to be_truthy
        end

        it 'deberia lanzar una excepcion al no contener las 3 etiquetas requeridas' do

          etiquetas_requeridas = [
                              "template",
                              "contactos",
                              "datos"]
          parametro_incorrectos_json = File.read("./archivos_de_prueba/data2_esquema_incorrecto.json")
          hash_gral = JSON.parse(parametro_incorrectos_json)

          expect{
                validador_de_etiquetas.validar(etiquetas_requeridas, hash_gral)
          }.to raise_exception(ExcepcionEtiqueta)
        end
    end
end