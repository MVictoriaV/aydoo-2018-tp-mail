require_relative '../model/parseador_contacto'

describe 'ParseadorContacto' do

    it 'deberia poder generar un contacto' do
        parseador = ParseadorContacto.new
        un_contacto_de_entrada = [
            {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]

        parseador.parsear(un_contacto_de_entrada)

        expect(parseador.contactos.size).to eq 1
    end

    it 'deberia tener un array de 2 contactos' do
        parseador = ParseadorContacto.new
        dos_contactos_de_entrada = [
            {"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"},
            {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]

        parseador.parsear(dos_contactos_de_entrada)

        expect(parseador.contactos.size).to eq 2
    end

    it 'deberia ser cero la cantidad de contactos retornada' do
        parseador = ParseadorContacto.new
        sin_contactos = []
        parseador.parsear(sin_contactos)
        expect(parseador.contactos.size).to eq 0
    end

    it 'deberia tener un array de 1 contacto ya que falta el nombre de uno de los dos contactos' do
        parseador = ParseadorContacto.new
        dos_contactos_de_entrada = [
            {"nombre"=>"kimi", "apellido"=>"raikkonen", "mail"=>"kimi.raikkonen@unmail.com"},
            {"nombre"=>"", "apellido"=>"ricciardo", "mail"=>"daniel.ricciardo@unmail.com"}]

        parseador.parsear(dos_contactos_de_entrada)

        expect(parseador.contactos.size).to eq 1
    end

    it 'deberia tener un array de 1 contacto ya que falta el apellido de uno de los dos contactos' do
        parseador = ParseadorContacto.new
        dos_contactos_de_entrada = [
            {"nombre"=>"kimi", "apellido"=>"raikkonen", "mail"=>"kimi.raikkonen@unmail.com"},
            {"nombre"=>"daniel", "apellido"=>"", "mail"=>"daniel.ricciardo@unmail.com"}]

        parseador.parsear(dos_contactos_de_entrada)

        expect(parseador.contactos.size).to eq 1
    end

    it 'deberia tener un array de 1 contacto ya que falta el mail de uno de los dos contactos' do
        parseador = ParseadorContacto.new
        dos_contactos_de_entrada = [
            {"nombre"=>"kimi", "apellido"=>"raikkonen", "mail"=>"kimi.raikkonen@unmail.com"},
            {"nombre"=>"daniel", "apellido"=>"ricciardo", "mail"=>""}]

        parseador.parsear(dos_contactos_de_entrada)

        expect(parseador.contactos.size).to eq 1
    end

    it 'deberia lanzar excepcion de contacto incompleto ya que falta el nombre del unico contacto contacto' do
        parseador = ParseadorContacto.new
        un_contacto_de_entrada = [
            {"nombre"=>"", "apellido"=>"raikkonen", "mail"=>"kimi.raikkonen@unmail.com"}]
        expect{parseador.parsear(un_contacto_de_entrada)}.to raise_exception(ContactoException)
    end

    it 'deberia lanzar excepcion de contacto incompleto ya que falta el apellido del unico contacto contacto' do
        parseador = ParseadorContacto.new
        un_contacto_de_entrada = [
            {"nombre"=>"kimi", "apellido"=>"", "mail"=>"kimi.raikkonen@unmail.com"}]
        expect{parseador.parsear(un_contacto_de_entrada)}.to raise_exception(ContactoException)
    end

    it 'deberia lanzar excepcion de contacto incompleto ya que falta el mail del unico contacto contacto' do
        parseador = ParseadorContacto.new
        un_contacto_de_entrada = [
            {"nombre"=>"kimi", "apellido"=>"raikkonen", "mail"=>""}]
        expect{parseador.parsear(un_contacto_de_entrada)}.to raise_exception(ContactoException)
    end

end