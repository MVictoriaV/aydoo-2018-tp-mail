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
end