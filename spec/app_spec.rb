require_relative '../app'
require 'rspec'
require 'rack/test'

describe 'Aplicacion Sinatra' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '/procesadorDeMail/un_nombre' do
    it 'deberia mostrar por pantalla el mensaje => Hola Juan <=.' do
      get '/procesadorDeMail/Juan'

      expect(last_response).to be_ok
    end
  end
end