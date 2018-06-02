require 'net/smtp'
require 'mailfactory'
require 'mail'

class EnviadorDeMail

	def initialize()
		@opciones = { :address              => "smtp.gmail.com",
	            :port                 => 587,
	            :authentication       => 'plain',
	            :enable_starttls_auto => true  }

	    @cuerpo_de_mail = nil
	    @mail_destino = nil
  	end

  	def configurar_mail()
  		unas_opciones = @opciones
  		estado_configuracion = nil
  		begin
			Mail.defaults do
			  	delivery_method :smtp, unas_opciones
			end
			estado_configuracion = true
		rescue Exception
			estado_configuracion = false
		end
		return estado_configuracion
	end

	def inyectar_cuerpo_del_mail(un_cuerpo)
		@cuerpo_de_mail = un_cuerpo
	end

	def inyectar_mail_detino(un_mail)
		@mail_destino = un_mail
	end

	def enviar_mail()
		enviado = nil
  		begin
			Mail.deliver do
			       to 'matytaa@gmail.com'
			     from @mail_destino
			  subject 'un_asunto'
			     body @cuerpo_de_mail
			end
			enviado = true
		rescue Exception
			enviado = false
		end
		return enviado
	end
end