require 'sinatra'
require 'json'
require 'erb'
require_relative './model/parseador_json'
require_relative './model/enviador_de_mail'
require_relative './model/plantilla'

@nombre = ''
@cuerpo_del_mail = ''

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
  enviador.inyectar_asunto(datos_del_mail.asunto)
  enviador.inyectar_mail_origen(datos_del_mail.mail_remitente)

  @contactos.each do |contacto|
    enviador.inyectar_mail_detino(contacto.get_mail())
    cuerpo = agregar_cuerpo(contacto.get_nombre(), datos_del_mail, template)
    enviador.inyectar_cuerpo_del_mail(cuerpo)
    enviador.enviar_mail()
  end
end

def agregar_cuerpo(nombre_contacto, datos_del_mail, template)

  mi_plantilla = Plantilla.new(
      nombre_contacto, 
      datos_del_mail.nombre_evento, 
      datos_del_mail.lugar_evento, 
      datos_del_mail.fecha_del_evento, 
      datos_del_mail.Mail_de_confirmacion)

  valor_del_template = template
  valor_a_mostrar = mi_plantilla.armar_plantilla(valor_del_template)

  rhtml = ERB.new(valor_a_mostrar)
  resultado = rhtml.result(mi_plantilla.get_binding)
  return resultado
end