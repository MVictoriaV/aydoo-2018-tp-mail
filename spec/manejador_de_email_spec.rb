require 'rspec'
require_relative '../model/manejador_de_email'

describe 'ManejadorDeEMail' do

	punto_de_entrada = File.read("./archivos_de_prueba/datos_prueba1.json")
	manejador_de_mail = ManejadorDeEMail.new

    it 'Recibe json comienza a armar un email con remitente y asunto' do
    	un_email = manejador_de_mail.armar_email(punto_de_entrada)
   		
        remitente_esperado = 'universidad@untref.com'
   		asunto_esperado = 'Invitación a fiesta de fin de año'

   		expect(un_email.remitente).to eq remitente_esperado
   		expect(un_email.asunto).to eq asunto_esperado
    end
end