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
  parseador_json = ParseadorJson.new
  parseador_json.parsear(request.body.read)
  status 200
end 