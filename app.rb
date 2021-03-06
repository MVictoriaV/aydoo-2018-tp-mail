require 'sinatra'
require 'erb'
require 'json'
require_relative './model/parseador_json'
require_relative './model/manejador_de_mail'

#curl -X POST -H "Content-Type: application/json" --data @json_contactos_datos.json localhost:4567/

post '/envio_mail_test' do
  parseador_json = ParseadorJson.new
  parseador_json.parsear(request.body.read)
  datos_del_mail = parseador_json.get_dato
  status 200
end

post '/' do
  manejador = ManejadorDeMail.new(request.body.read)
  respuesta = manejador.enviar
  if respuesta.nil?
    status 500
  else
    status 200
    respuesta.to_json
  end
end