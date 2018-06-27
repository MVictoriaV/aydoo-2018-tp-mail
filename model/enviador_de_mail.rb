require 'mail'
require 'socket'
require 'timeout'
require_relative 'servicio_de_mail_exception'

class EnviadorDeMail

	def initialize
	    configurar_mail
  	end

  	def configurar_mail
		Mail.defaults do
		  	delivery_method :smtp, address: "localhost", port: 1025
		end
		return true
	end

	def enviar_mail(email)
		unless el_puerto_esta_levantado?('127.0.0.1', 1080)
			raise ServicioDeMailException.new
		end
		email.contacto_cuerpo_mail.each do |contacto, cuerpo|
			Mail.deliver do
			       to email.remitente
			     from contacto
			  subject email.asunto
			     body cuerpo
			end
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