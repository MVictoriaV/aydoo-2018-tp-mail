require 'sinatra'
require 'json'
require_relative './model/parseador_json'
require_relative './model/enviador_de_mail'

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
  envia_mail("mensaje")
  status 200
end

def envia_mail(cuerpo)
  enviador = EnviadorDeMail.new
  enviador.configurar_mail()
  enviador.inyectar_cuerpo_del_mail(cuerpo)
  enviador.inyectar_mail_detino("destino@ejemplo.com")
  enviador.inyectar_asunto("un asuynto")
  enviador.enviar_mail()
end