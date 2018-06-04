require 'rspec'
require 'rack/test'
require 'net/http'
require 'uri'
require 'json'
require_relative '../app'

class AppSpec

  describe 'Aplicacion Sinatra' do
    include Rack::Test::Methods

    def app
      Sinatra::Application
    end

    parametro_json = File.read("./archivos_de_prueba/datos_prueba1.json")

    describe '/procesadorDeMail/un_nombre' do
      it 'deberia mostrar por pantalla el mensaje => Hola Juan <=.' do
        get '/procesadorDeMail/Juan'

        expect(last_response).to be_ok
      end
    end

    describe '/envio_mail_test' do
      it 'deberia llegar el json y retornar estado ok' do
        post '/envio_mail_test', parametro_json, "CONTENT_TYPE" => "application/json"
         expect(last_response).to be_ok
      end
    end
  end
end