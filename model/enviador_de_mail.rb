require 'mail'

class EnviadorDeMail
	attr_reader :MAIL_ORIGEN

	def initialize()
	    @cuerpo_de_mail = nil
	    @mail_destino = nil
	    @asunto = nil
	    @MAIL_ORIGEN = nil
  	end

  	def configurar_mail()
		Mail.defaults do
		  	delivery_method :smtp, address: "localhost", port: 1025
		end
		return true
	end

	def inyectar_mail_origen(un_mail)
	    @MAIL_ORIGEN = un_mail
  	end

	def inyectar_cuerpo_del_mail(un_cuerpo)
		@cuerpo_de_mail = un_cuerpo
	end

	def inyectar_mail_detino(un_mail)
		@mail_destino = un_mail
	end

	def inyectar_asunto(un_asunto)
		@asunto = un_asunto
	end

	def enviar_mail()
		origen = @MAIL_ORIGEN
		destino = @mail_destino
		un_asunto = @asunto
		cuerpo = @cuerpo_de_mail

		Mail.deliver do
		       to origen
		     from destino
		  subject un_asunto
		     body cuerpo
		end
		return true
	end
end