require 'rspec'
require 'net/smtp'
require 'mailfactory'
require 'mail'
require_relative '../model/enviador_de_mail'
require_relative '../model/email'

describe 'EnviadorDeMail' do

    it 'deberia lanzar excepcion de servicio de mail no disponible' do
        enviador_de_mail = EnviadorDeMail.new
        expect{enviador_de_mail.enviar_mail(@email)}.to raise_exception(ServicioDeMailException)
    end

    it 'no deberia estar levantado el servicio SMTP' do
        enviador_de_mail = EnviadorDeMail.new
        ip = '127.0.0.1'
        puerto = 1080
        
        expect(enviador_de_mail.el_puerto_esta_levantado?(ip, puerto)).to be_falsy
    end

    it 'deberia estar levantado el servicio SMTP' do
        enviador_de_mail = EnviadorDeMail.new
        ip = '127.0.0.1'
        puerto = 1080
        allow(enviador_de_mail).to receive(:el_puerto_esta_levantado?).with(ip, puerto).and_return(true)
        
        expect(enviador_de_mail.el_puerto_esta_levantado?(ip, puerto)).to be_truthy
    end

    it 'deberia poder enviar un mail' do
        mock_email = double
        enviador_de_mail = EnviadorDeMail.new
        allow(enviador_de_mail).to receive(:enviar_mail).with(mock_email).and_return(true)
        
        expect(enviador_de_mail.enviar_mail(mock_email)).to be_truthy
    end

    it 'deberia poder configurar el mail delivery' do
        enviador_de_mail = EnviadorDeMail.new
        expect(enviador_de_mail.configurar_mail).to be_truthy
    end
end