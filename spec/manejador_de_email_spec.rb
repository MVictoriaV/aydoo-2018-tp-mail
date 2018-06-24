require 'rspec'
require_relative '../model/manejador_de_email'

describe 'ManejadorDeEMail' do

  before(:each) do
    @manejador_de_mail = ManejadorDeEMail.new
    @email = double

    cuerpo = "Hola juan,\n\r Por medio del presente mail te estamos invitando a la cena de fin de año de la UNTREF, que se desarrollará en el Centro de estudios (avenida Directorio 887, Caseros), el día 5 de diciembre. Por favor confirmar su participación enviando un mail a fiesta@untref.com.\n\rSin otro particular.La direccion"

    allow(@email).to receive(:contacto_cuerpo_mail).and_return({"juanperez@test.com" => cuerpo})
    allow(@email).to receive(:remitente).and_return("universidad@untref.com")
    allow(@email).to receive(:asunto).and_return("Invitación a fiesta de fin de año")
  end

  it 'recibe json comienza a armar un email con remitente y asunto' do
    punto_de_entrada = File.read("./archivos_de_prueba/datos_prueba1.json")
  	@manejador_de_mail.armar_email(punto_de_entrada)
 		
    remitente_esperado = "universidad@untref.com"
 		asunto_esperado = "Invitación a fiesta de fin de año"

 		expect(@manejador_de_mail.email.remitente).to eq remitente_esperado
 		expect(@manejador_de_mail.email.asunto).to eq asunto_esperado
  end

  it 'deberia retornar nil cuando recibe json incorrecto' do
    punto_de_entrada = File.read("./archivos_de_prueba/data2_esquema_incorrecto.json")
    
    expect{@manejador_de_mail.armar_email(punto_de_entrada)}.to raise_exception(EtiquetaInexistenteException)
  end

  skip 'recibe un email que no es nil' do
    	resultado = @manejador_de_mail.enviar(@email)
      expect(resultado).to be_truthy
  end
end