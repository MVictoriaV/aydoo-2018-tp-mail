require 'rspec'
require 'json'
require_relative '../model/email'
require_relative '../model/punto_entrada_nulo_exception'
require_relative '../model/remitente_exception'
require_relative '../model/asunto_inexistente_exception'
require_relative '../constantes/constantes_de_fecha'
require_relative '../modules/formateador_fecha'

include ConstantesDeFecha
include FormateadorFecha

describe 'EMail' do

  before(:each) do
      punto_de_entrada = File.read("./archivos_de_prueba/datos_prueba1.json")
      @contacto_con_etiquetas = File.read("./archivos_de_prueba/json_contacto_etiquetas_especiales.json")
      @contactos_con_etiquetas = File.read("./archivos_de_prueba/json_contactos_datos.json")
      datos = OpenStruct.new(JSON.parse(punto_de_entrada))
      @email = EMail.new(datos)
  end

  it 'Se crea email con los datos necesarios' do
    expect(@email.remitente).to be
    expect(@email.asunto).to be
  end

  it 'deberia lanzar excepcion cuando se crea email con argumento nil' do
    expect{EMail.new(nil)}.to raise_exception(PuntoEntradaNuloException)
  end

  it 'deberia lanzar excepcion cuando no se pasa el remitente' do

    dato_sin_remitente = File.read("./archivos_de_prueba/datos_sin_remitente.json")
    datos_grales = OpenStruct.new(JSON.parse(dato_sin_remitente))

    expect{EMail.new(datos_grales)}.to raise_exception(RemitenteException)
  end

  it 'deberia lanzar excepcion cuando no se pasa el asunto' do

    dato_sin_asunto = File.read("./archivos_de_prueba/datos_sin_asunto.json")
    datos_grales = OpenStruct.new(JSON.parse(dato_sin_asunto))

    expect{EMail.new(datos_grales)}.to raise_exception(AsuntoInexistenteException)
  end

  it 'deberia contener los emails de juan y maria' do
    @email.cargar_cuerpo_a_contacto

    expect(@email.contacto_cuerpo_mail.key?("juanperez@test.com")).to be_truthy
    expect(@email.contacto_cuerpo_mail.key?("mariagonzalez@test.com")).to be_truthy
  end

  it 'deberia tener el cuerpo de email armado correctamente' do

    @email.cargar_cuerpo_a_contacto

    cuerpo_resultado = @email.contacto_cuerpo_mail["juanperez@test.com"]
    cuerpo_esperado = "Hola juan,\n\r Por medio del presente mail te estamos invitando a la cena de fin de año de la UNTREF, que se desarrollará en el Centro de estudios (avenida Directorio 887, Caseros), el día 5 de diciembre. Por favor confirmar su participación enviando un mail a fiesta@untref.com.\n\rSin otro particular.La direccion"

    expect(cuerpo_resultado).to include(cuerpo_esperado)
  end

  it 'deberia tener 2 contactos cargados' do
    @email.cargar_cuerpo_a_contacto
    expect(@email.contacto_cuerpo_mail.size()).to eq 2
  end

  it 'deberia reemplazar etiqueta empty por uruguay' do
    @contacto_con_etiquetas
    datos = OpenStruct.new(JSON.parse(@contacto_con_etiquetas))
    @email = EMail.new(datos)
    @email.cargar_cuerpo_a_contacto
    resultado = @email.contacto_cuerpo_mail.to_s
    expect(resultado).to include('empty uruguay')
  end

  it 'deberia reemplazar etiqueta sum por la suma de 4 y 3' do
    @contacto_con_etiquetas
    datos = OpenStruct.new(JSON.parse(@contacto_con_etiquetas))
    @email = EMail.new(datos)
    @email.cargar_cuerpo_a_contacto
    resultado = @email.contacto_cuerpo_mail.to_s
    expect(resultado).to include('sum 7')
  end

  it 'deberia reemplazar etiqueta time:12 por la hora actual' do
    fecha_actual = aplicar_formato(ConstantesDeFecha::FORMATO_HORA_12)
    resultado_esperado = "time " + fecha_actual.to_s
    
    @contacto_con_etiquetas
    datos = OpenStruct.new(JSON.parse(@contacto_con_etiquetas))
    @email = EMail.new(datos)
    @email.cargar_cuerpo_a_contacto
    resultado = @email.contacto_cuerpo_mail.to_s
    expect(resultado).to include(resultado_esperado)
  end

  it 'deberia reemplazar etiqueta date:i por la hora actual' do
    fecha_actual = aplicar_formato(ConstantesDeFecha::FORMATO_FECHA_INVERTIDA)
    
    resultado_esperado = "date " + fecha_actual.to_s
    
    @contacto_con_etiquetas
    datos = OpenStruct.new(JSON.parse(@contacto_con_etiquetas))
    @email = EMail.new(datos)
    @email.cargar_cuerpo_a_contacto
    resultado = @email.contacto_cuerpo_mail.to_s
    expect(resultado).to include(resultado_esperado)
  end

  it 'deberia tener 5 contactos ya que a un contacto se encuentra incompleto' do
    @contacto_con_etiquetas
    datos = OpenStruct.new(JSON.parse(@contactos_con_etiquetas))
    @email = EMail.new(datos)
    @email.cargar_cuerpo_a_contacto
    expect(@email.contacto_cuerpo_mail.size()).to eq 5
  end

end