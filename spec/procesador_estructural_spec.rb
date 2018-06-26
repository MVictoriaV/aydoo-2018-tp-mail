require 'rspec'
require 'json'
require_relative '../model/procesador_estructural'
require_relative '../model/etiqueta_inexistente_exception'

describe 'ProcesadorEstructural' do

    punto_de_entrada = File.read("./archivos_de_prueba/datos_prueba1.json")
    procesador = ProcesadorEstructural.new

    it 'deberia tener hash datos al recibir un json como parametro del cual arma la estructura' do      

        resultado_esperado = JSON.parse('{"datos":{
                               "remitente": "universidad@untref.com",
                               "asunto":"Invitación a fiesta de fin de año",
                               "nombre_evento":"la cena de fin de año de la UNTREF",
                               "lugar_evento":"el Centro de estudios (avenida Directorio 887, Caseros)",
                               "fecha_del_evento":"5 de diciembre",
                               "mail_de_confirmacion":"fiesta@untref.com"}}')
        procesador.crear_estructura(JSON.parse(punto_de_entrada))      
        resultado_actual = procesador.estructura[:datos]

        expect(resultado_actual).to eq resultado_esperado["datos"]
    end

    it 'deberia lanzar excepcion al recibir un json como parametro sin contactos' do

        punto_de_entrada_incorrecta = File.read("./archivos_de_prueba/data2_esquema_incorrecto.json")

        expect{
              procesador.crear_estructura(JSON.parse(punto_de_entrada_incorrecta))
            }.to raise_exception(EtiquetaInexistenteException)
    end

    it 'deberia recibir un json como parametro con los 3 campos necesarios' do      

        procesador.crear_estructura(JSON.parse(punto_de_entrada))      
        resultado_template = procesador.estructura[:template]
        resultado_contactos = procesador.estructura[:contactos]
        resultado_datos = procesador.estructura[:datos]

        expect(resultado_template).to be
        expect(resultado_contactos).to be
        expect(resultado_datos).to be
    end
end