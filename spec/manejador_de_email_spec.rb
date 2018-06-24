require 'rspec'
require_relative '../model/manejador_de_email'

describe 'ManejadorDeEMail' do

  before(:each) do
    @manejador_de_email = ManejadorDeEMail.new
    @mock_manejador_de_email = double
    @un_archivo_de_contactos_datos_template = File.read("./archivos_de_prueba/datos_prueba1.json")

    allow(@mock_manejador_de_email).to receive(:armar_email).with(@un_archivo_de_contactos_datos_template).and_return(true)
    allow(@mock_manejador_de_email).to receive(:enviar).and_return(true)
  end

  it 'recibe json comienza a armar un email con remitente y asunto' do
    punto_de_entrada = File.read("./archivos_de_prueba/datos_prueba1.json")
  	@manejador_de_email.armar_email(punto_de_entrada)
 		
    remitente_esperado = "universidad@untref.com"
 		asunto_esperado = "Invitación a fiesta de fin de año"

 		expect(@manejador_de_email.email.remitente).to eq remitente_esperado
 		expect(@manejador_de_email.email.asunto).to eq asunto_esperado
  end

  it 'deberia retornar nil cuando recibe json incorrecto' do
    punto_de_entrada = File.read("./archivos_de_prueba/data2_esquema_incorrecto.json")
    
    expect{@manejador_de_email.armar_email(punto_de_entrada)}.to raise_exception(EtiquetaInexistenteException)
  end

  it 'deberia poder enviar un mail ya que cumple con la estructura necesaria el json recibido' do
    if @manejador_de_email.armar_email(@un_archivo_de_contactos_datos_template)
      resultado = @mock_manejador_de_email.enviar
      expect(resultado).to be_truthy
    end
  end
end