require 'rspec'
require 'json'
require_relative '../model/email'
require_relative '../model/punto_entrada_nulo_exception'
require_relative '../model/remitente_exception'

describe 'EMail' do

  punto_de_entrada = File.read("./archivos_de_prueba/datos_prueba1.json")

  it 'Se crea email con los datos necesarios' do
    
    datos_grales = OpenStruct.new(JSON.parse(punto_de_entrada))

    email = EMail.new(datos_grales)
    
    expect(email.remitente).to be
    expect(email.contactos).to be
    expect(email.asunto).to be
    expect(email.cuerpo).to be
  end

  it 'Se crea email con argumento nil deberia lanzar excepcion' do
    expect{EMail.new(nil)}.to raise_exception(PuntoEntradaNuloException)
  end

  it 'No se pasa remitente deberia lanzar excepcion' do

    dato_sin_remitente = File.read("./archivos_de_prueba/datos_sin_remitente.json")
    datos_grales = OpenStruct.new(JSON.parse(dato_sin_remitente))

    expect{EMail.new(datos_grales)}.to raise_exception(RemitenteException)
  end
end