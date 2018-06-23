require 'rspec'
require 'net/smtp'
require 'mailfactory'
require 'mail'
require_relative '../model/enviador_de_mail'

class EnviadorDeMailSpec

    describe 'EnviadorDeMail' do
    	
        
        before(:each) do
            @mi_enviador_de_mail = EnviadorDeMail.new

            @un_enviador = double
            allow(@un_enviador).to receive(:inyectar_cuerpo_del_mail).with("cuerpo del mail").and_return("cuerpo del mail")
            allow(@un_enviador).to receive(:inyectar_asunto).with("invitacion").and_return("invitacion")
            allow(@un_enviador).to receive(:inyectar_mail_detino).with("un_mail@test.com").and_return("un_mail@test.com")
            allow(@un_enviador).to receive(:configurar_mail).and_return(true)

            allow(@un_enviador).to receive(:cuerpo_del_mail).and_return("cuerpo del mail")
            allow(@un_enviador).to receive(:asunto).and_return("invitacion")
            allow(@un_enviador).to receive(:mail_detino).and_return("un_mail_destino@test.com")
            allow(@un_enviador).to receive(:mail_origen).and_return("un_mail_origen@test.com")
            allow(@un_enviador).to receive(:enviar_mail).and_return(true)
        end
 
        it 'deberia poder asiganar el cuerpo de un mail' do
        	un_cuerpo = @mi_enviador_de_mail.inyectar_cuerpo_del_mail("cuerpo del mail")
        	expect(un_cuerpo).to include("cuerpo del mail")
        end
        
        it 'deberia poder asiganar el mail destino' do
            un_mail = @mi_enviador_de_mail.inyectar_mail_detino("un_mail@test.com")
            expect(un_mail).to include("un_mail@test.com")
        end

        it 'deberia poder asiganar el asunto del mail' do
            un_asunto = @mi_enviador_de_mail.inyectar_asunto("invitacion")
            expect(un_asunto).to include("invitacion")
        end

        it 'deberia poder asiganar el mail de origen' do
            un_mail = @mi_enviador_de_mail.inyectar_cuerpo_del_mail("universidad@untref.com")
            expect(un_mail).to include("universidad@untref.com")
        end

        it 'deberia poder configurar el servicio SMTP' do            
            expect(@un_enviador.configurar_mail).to be_truthy
        end

        it 'deberia lanzar excepcion de servicio de mail no disponible' do
            expect{@mi_enviador_de_mail.enviar_mail}.to raise_exception(ServicioDeMailException)
        end

        it 'deberia poder enviar un mail' do
            
            expect(@un_enviador.cuerpo_del_mail).to include("cuerpo del mail")
            expect(@un_enviador.asunto).to include("invitacion")
            expect(@un_enviador.mail_detino).to include("un_mail_destino@test.com")
            expect(@un_enviador.mail_origen).to include("un_mail_origen@test.com")

            expect(@un_enviador.enviar_mail).to be_truthy
        end
    end
end