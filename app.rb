require 'sinatra'
require 'json'
require_relative './model/manejador_de_email'

post '/' do
  begin
    enviar_mail
    status 200
    {"resultado": "ok"}.to_json
  rescue ServicioDeMailException => e
    status 503
    {"resultado": "el servicio SMTP no se encuentra disponible"}.to_json
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