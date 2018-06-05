require_relative 'parseador_json'
require_relative 'enviador_de_mail'
require_relative 'plantilla'
require_relative 'esquema_plantilla'
require 'erb'
require 'json'

class ManejadorDeMail

  def initialize(un_json)
    @mi_json = un_json
    @contactos = nil
  end

  def enviar
    parseador_json = ParseadorJson.new
    
    begin
      resultado = parseador_json.parsear(@mi_json)
    rescue Exception => msg
        puts msg.message
    end
    
    datos_del_mail = parseador_json.get_dato
    @contactos = parseador_json.get_contactos
    template = parseador_json.get_cuerpo_mail
    envia_mail(datos_del_mail, template)
    return resultado
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
    return true
  end

  def agregar_cuerpo(nombre_contacto, datos_del_mail, template)
    un_esquema = EsquemaPlantilla.new(
                        nombre_contacto, 
                        datos_del_mail.nombre_evento, 
                        datos_del_mail.lugar_evento, 
                        datos_del_mail.fecha_del_evento, 
                        datos_del_mail.Mail_de_confirmacion)
    
    mi_plantilla = Plantilla.new(un_esquema)    

    valor_del_template = template
    valor_a_mostrar = mi_plantilla.armar_plantilla(valor_del_template)

    rhtml = ERB.new(valor_a_mostrar)
    resultado = rhtml.result(mi_plantilla.get_binding)
    return resultado
  end
end