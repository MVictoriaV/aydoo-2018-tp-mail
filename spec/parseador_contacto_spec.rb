require_relative '../model/parseador_contacto'

class ParseadorContactoSpec

    describe 'ParseadorContacto' do
    	
        mi_parseador = ParseadorContacto.new()
        it 'deberia retornar el nombre' do
            un_nombre = "kimi"
            un_apellido = "raikkonen"
            un_mail = "kimi.raikkonen@unmail.com"
            una_linea = un_nombre + ","+ un_apellido +"," + un_mail
        	expect(mi_parseador.parsear(una_linea)).to include(un_nombre)
        end
    end
end