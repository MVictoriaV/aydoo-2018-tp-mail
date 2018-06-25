require 'rspec'
require_relative '../model/armador_de_plantilla'

describe 'ArmadorDePlantilla' do

    it 'deberia poder formatear etiqueta' do
        template = "Hola <nombre>"
        template_final = "Hola <%=nombre%>"
        un_armador = ArmadorDePlantilla.new()

        resultado = un_armador.armar(template)
        expect(resultado).to include(template_final)
    end

    it 'deberia poder formatear ambas etiquetas' do
    	template = "Hola <nombre> te estamos invitando a <nombre_evento>"
        template_final = "Hola <%=nombre%> te estamos invitando a <%=nombre_evento%>"
        un_armador = ArmadorDePlantilla.new()

        resultado = un_armador.armar(template)
        expect(resultado).to include(template_final)
    end

    it 'deberia poder formatear solamente etiquetas simples' do
    	template = "Hola <nombre> te estamos invitando a <nombre_evento> <empty(uruguay,argentina)>"
        template_final = "Hola <%=nombre%> te estamos invitando a <%=nombre_evento%> <empty(uruguay,argentina)>"
        un_armador = ArmadorDePlantilla.new()

        resultado = un_armador.armar(template)
        expect(resultado).to include(template_final)
    end
end