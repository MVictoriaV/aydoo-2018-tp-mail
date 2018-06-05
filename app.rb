require 'sinatra'
require 'json'
require_relative './model/parseador_json'
require_relative './model/enviador_de_mail'

@nombre = ''
@cuerpo_del_mail = ''

#curl -X POST -H "Content-Type: application/json" --data @data1.json localhost:4567/

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
  parseador_json = ParseadorJson.new
  parseador_json.parsear(request.body.read)
  datos_del_mail = parseador_json.get_dato
  @cuerpo_del_mail = parseador_json.get_cuerpo_mail
  @contactos = parseador_json.get_contactos
  template = erb :plantilla
  envia_mail(datos_del_mail, template)
  status 200
end


def envia_mail(datos_del_mail, template)
  enviador = EnviadorDeMail.new
  enviador.configurar_mail()
  enviador.inyectar_cuerpo_del_mail(template)
  enviador.inyectar_asunto(datos_del_mail.asunto)
  @contactos.each do |contacto|
    enviador.inyectar_mail_detino(contacto.get_mail())
    enviador.enviar_mail()
  end
end