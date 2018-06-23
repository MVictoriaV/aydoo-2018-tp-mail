require 'mail'
require 'socket'
require 'timeout'
require_relative 'servicio_de_mail_exception'


class EnviadorDeMail

	def initialize()
	    @cuerpo_de_mail = nil
	    @mail_destino = nil
	    @asunto = nil
	    @mail_origen = nil
  	end

  	def configurar_mail()
		Mail.defaults do
		  	delivery_method :smtp, address: "localhost", port: 1025
		end
		return true
	end

	def inyectar_mail_origen(un_mail)
	    @mail_origen = un_mail
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
		unless el_puerto_esta_levantado?('127.0.0.1', 1080)
			raise ServicioDeMailException.new
		end
		origen = @mail_origen
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

	def el_puerto_esta_levantado?(ip, puerto)

		begin
			Timeout::timeout(1) do
		  	begin
		    	socket = TCPSocket.new(ip, puerto)
		    	socket.close
		    	return true
		  	rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
		    	return false
		  	end
		end
		rescue Timeout::Error
		end
	  	return false
	end
end