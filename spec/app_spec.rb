require 'rspec'
require 'rack/test'
require 'net/http'
require 'uri'
require 'json'
require_relative '../app'

describe 'Aplicacion Sinatra' do
  include Rack::Test::Methods

  def app
      Sinatra::Application
  end

  parametro_json = File.read("./archivos_de_prueba/datos_prueba1.json")
  parametro_json_incompleto = File.read("./archivos_de_prueba/data2_esquema_incorrecto.json")
  contacto_sin_nombre = File.read("./archivos_de_prueba/json_contacto_incompleto.json")
  datos_sin_asunto = File.read("./archivos_de_prueba/datos_sin_asunto.json")
  dato_sin_remitente = File.read("./archivos_de_prueba/datos_sin_remitente.json")

  describe '/' do
    it 'levanta archivo json con datos incompletos deberia dar un estado 500' do      
        post '/', parametro_json_incompleto, "CONTENT_TYPE" => "application/json"
        expect(last_response.status).to be == 500
    end
  end

  describe '/' do
    it 'deberia retornar estado 503 servicio SMTP no disponible' do
        post '/', parametro_json, "CONTENT_TYPE" => "application/json"
        expect(last_response.status).to be == 503
    end
  end

  describe '/' do
    it 'deberia lanzar excepcion contacto incompleto' do
        post '/', contacto_sin_nombre, "CONTENT_TYPE" => "application/json"
        expect(last_response.status).to be == 500
    end
  end
  
  describe '/' do
    it 'deberia lanzar excepcion asunto inexistente' do
        post '/', datos_sin_asunto, "CONTENT_TYPE" => "application/json"
        expect(last_response.status).to be == 500
    end
  end

  describe '/' do
    it 'deberia lanzar excepcion cuando no se pasa el remitente' do
        post '/', dato_sin_remitente, "CONTENT_TYPE" => "application/json"
        expect(last_response.status).to be == 500
    end
  end
  
end