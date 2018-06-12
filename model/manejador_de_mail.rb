require_relative 'parseador_json'
require_relative 'enviador_de_mail'
require_relative 'plantilla_mail'
require_relative 'esquema_plantilla'
require_relative 'armador_de_plantilla'
require 'erb'
require 'json'

class ManejadorDeMail

  def initialize(un_json)
    @mi_json = un_json
    @contactos = nil
    @template = nil
  end

  def enviar
    begin
      resultado = armar_estructura_del_mail
    rescue Exception => msg
      puts msg.message
      return nil
    end

    una_plantilla = @template.to_s
    template_formateado = obtener_plantilla_con_formato(una_plantilla)
    envia_mail(datos_del_mail, template_formateado)
    
    return resultado
  end

  def armar_estructura_del_mail
    parseador_json = ParseadorJson.new
    
    begin
        resultado = parseador_json.parsear(@mi_json)
    rescue Exception => msg
        puts msg.message
        return nil
    end
    
    datos_del_mail = parseador_json.get_dato
    @contactos = parseador_json.get_contactos
    @template = parseador_json.get_cuerpo_mail
    return resultado
  end

  def envia_mail(datos_del_mail, template_formateado)
    enviador = EnviadorDeMail.new
    enviador.configurar_mail()
    enviador.inyectar_asunto(datos_del_mail.asunto)
    enviador.inyectar_mail_origen(datos_del_mail.remitente)

    @contactos.each do |contacto|
      enviador.inyectar_mail_detino(contacto.get_mail())
      item = crear_esquema_plantilla(contacto.get_nombre(), datos_del_mail)
      cuerpo = cargar_cuerpo(item, template_formateado)
      enviador.inyectar_cuerpo_del_mail(cuerpo)
      enviador.enviar_mail()
    end
    return true
  end

  private
  def crear_esquema_plantilla(nombre_contacto, datos_del_mail)
    item = EsquemaPlantilla.new(nombre_contacto, datos_del_mail)
  end

  private
  def cargar_cuerpo(item, plantilla_formateada)
    plantilla = PlantillaMail.new(item, plantilla_formateada)
    resultado = plantilla.renderizar
    return resultado
  end

  private
  def obtener_plantilla_con_formato(plantilla)
    armador = ArmadorDePlantilla.new
    plantilla_formateada = armador.armar(plantilla)
    return plantilla_formateada
  end
end