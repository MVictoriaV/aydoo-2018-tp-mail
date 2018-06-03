require 'sinatra'
require 'json'
require_relative './model/parseador_json'

@nombre = ''

#curl -X POST -H "Content-Type: application/json" --data @data1.json localhost:4567/

get '/procesadorDeMail/:nombre' do
  @nombre = params[:nombre]
  erb :plantilla
  status 200
end

post '/' do
  request_payload = JSON.parse request.body.read
  parseador_json = ParseadorJson.new
  parseador_json.parsear?(request_payload)
  status 200
end 