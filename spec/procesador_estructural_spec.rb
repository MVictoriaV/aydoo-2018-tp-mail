require 'rspec'
require 'json'
require_relative '../model/procesador_estructural'

describe 'ProcesadorEstructural' do

    punto_de_entrada = File.read("./archivos_de_prueba/datos_prueba1.json")

    it 'Recibe un json como parametro del cual arma la estructura, deberia tener hash datos' do
      
      procesador = ProcesadorEstructural.new

      resultado_esperado = JSON.parse('{"datos":{
                             "remitente": "universidad@untref.com",
                             "asunto":"Invitación a fiesta de fin de año",
                             "nombre_evento":"la cena de fin de año de la UNTREF",
                             "lugar_evento":"el Centro de estudios (avenida Directorio 887, Caseros)",
                             "fecha_del_evento":"5 de diciembre",
                             "mail_de_confirmacion":"fiesta@untref.com"}}')
      resultado_actual = procesador.crear_estructura(JSON.parse(punto_de_entrada))      

      expect(resultado_actual[:datos]).to eq resultado_esperado["datos"]
    end
end