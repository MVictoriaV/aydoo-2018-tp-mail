require 'rspec'
require_relative '../model/manejador_de_email'

describe 'ManejadorDeEMail' do

  before(:each) do
    @manejador_de_email = ManejadorDeEMail.new
    @mock_manejador_de_email = double
    @un_archivo_de_contactos_datos_template = File.read("./archivos_de_prueba/datos_prueba1.json")
    @archivo_esquema_incompleto = File.read("./archivos_de_prueba/data2_esquema_incorrecto.json")

    allow(@mock_manejador_de_email).to receive(:armar_email).with(@un_archivo_de_contactos_datos_template).and_return(true)
    allow(@mock_manejador_de_email).to receive(:enviar).and_return(true)
  end

  it 'deberia haber cargado el email correctamente' do
    resultado = @manejador_de_email.armar_email(@un_archivo_de_contactos_datos_template)
    expect(resultado).to be_falsey
  end

  it 'recibe json comienza a armar un email con remitente y asunto' do
    punto_de_entrada = File.read("./archivos_de_prueba/datos_prueba1.json")
    @manejador_de_email.armar_email(punto_de_entrada)
    
    remitente_esperado = "universidad@untref.com"
    asunto_esperado = "Invitación a fiesta de fin de año"

    expect(@manejador_de_email.email.remitente).to eq remitente_esperado
    expect(@manejador_de_email.email.asunto).to eq asunto_esperado
  end

  it 'deberia lanzar excepcion cuando recibe json incompleto' do
    expect{@manejador_de_email.armar_email(@archivo_esquema_incompleto)}.to raise_exception(EtiquetaInexistenteException)
  end

  it 'deberia poder enviar un mail ya que el atributo email no es nil' do
    expect(@manejador_de_email.armar_email(@un_archivo_de_contactos_datos_template)).to be_falsey
    resultado = @mock_manejador_de_email.enviar
    expect(resultado).to be_truthy
  end

end