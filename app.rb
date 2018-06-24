require 'sinatra'
require 'json'
require_relative './model/manejador_de_mail'
require_relative './model/manejador_de_email'

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

post '/nuevo' do
  begin
    enviar_mail
    status 200
    {"resultado": "ok"}.to_json
  rescue Exception => e
    status 500
    {"resultado": "error, entrada incorrecta"}.to_json
  end
end

def enviar_mail
    manejador_de_email = ManejadorDeEMail.new
    manejador_de_email.armar_email(request.body.read)
    manejador_de_email.enviar
end