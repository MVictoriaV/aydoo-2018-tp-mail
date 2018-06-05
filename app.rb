require 'sinatra'
require 'erb'
require_relative './model/parseador_json'
require_relative './model/manejador_de_mail'

@nombre = ''
#curl -X POST -H "Content-Type: application/json" --data @json_contactos_datos.json localhost:4567/

get '/procesadorDeMail/:nombre' do
  @nombre = params[:nombre]
  erb :plantilla
  status 200
end

post '/envio_mail_test' do
  parseador_json = ParseadorJson.new
  parseador_json.parsear(request.body.read)
  datos_del_mail = parseador_json.get_dato
  status 200
end

post '/' do
  manejador = ManejadorDeMail.new(request.body.read)
  manejador.enviar
  status 200
end