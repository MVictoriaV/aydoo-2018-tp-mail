require 'rspec'
require 'net/smtp'
require 'mailfactory'
require 'mail'
require_relative '../model/enviador_de_mail'

class EnviadorDeMailSpec

    describe 'EnviadorDeMail' do
    	mi_enviador_de_mail = EnviadorDeMail.new
 
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

        it 'deberia enviar un mail' do

            enviador = double()
            enviador.stub(:inyectar_cuerpo_del_mail).with("cuerpo del mail").and_return("cuerpo del mail")
            enviador.stub(:inyectar_asunto).with("invitacion").and_return("invitacion")
            enviador.stub(:inyectar_mail_detino).with("un_mail@test.com").and_return("un_mail@test.com")
            enviador.stub(:configurar_mail).and_return(true)
            enviador.stub(:enviar_mail).and_return(true)
        end
    end
end