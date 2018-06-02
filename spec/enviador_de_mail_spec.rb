require 'rspec'
require 'net/smtp'
require 'mailfactory'
require 'mail'
require_relative '../model/enviador_de_mail'

class EnviadorDeMailSpec

    describe 'EnviadorDeMail' do
    	mi_enviador_de_mail = EnviadorDeMail.new
    	it 'deberia ser correcta la configuracion mail' do
        	expect(mi_enviador_de_mail.configurar_mail()).to be true
        end
        
		it 'no deberia poder enviar un mail ya que falta mail de servidor' do
            	mi_enviador_de_mail.configurar_mail()
            	expect(mi_enviador_de_mail.enviar_mail()).to be false
        end

        it 'deberia poder asiganar el cuerpo de un mail' do
        	un_cuerpo = mi_enviador_de_mail.inyectar_cuerpo_del_mail("cuerpo del mail")
        	expect(un_cuerpo).to include("cuerpo del mail")
        end
        
        it 'deberia poder asiganar el mail destino' do
            un_mail = mi_enviador_de_mail.inyectar_mail_detino("un_mail@test.com")
            expect(un_mail).to include("un_mail@test.com")
        end

        it 'deberia poder asiganar el asunto del mail' do
            un_asunto = mi_enviador_de_mail.inyectar_asunto("invitacion")
            expect(un_asunto).to include("invitacion")
        end
    end
end