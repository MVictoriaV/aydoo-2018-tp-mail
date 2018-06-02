require_relative '../model/contacto'

class ContactoSpec

    describe 'Contacto' do
    	
        un_contacto = Contacto.new("kimi","raikkonen","kimi.raikkonen@unmail.com")
        it 'deberia retornar el nombre del contacto' do
        	expect(un_contacto.get_nombre()).to include("kimi")
        end

        it 'deberia retornar el apellido del contacto' do
            expect(un_contacto.get_apellido()).to include("raikkonen")
        end

        it 'deberia retornar el mail del contacto' do
            expect(un_contacto.get_mail()).to include("kimi.raikkonen@unmail.com")
        end

        it 'deberia lanzar excepcion falta el nombre' do
            expect{
                contacto_sin_nombre = Contacto.new("","raikkonen","kimi.raikkonen@unmail.com")
            }.to raise_exception(ExcepcionContacto)
        end

        it 'deberia lanzar excepcion falta el apellido' do
            expect{
                contacto_sin_nombre = Contacto.new("kimi",nil,"kimi.raikkonen@unmail.com")
            }.to raise_exception(ExcepcionContacto)
        end

        it 'deberia lanzar excepcion falta el mail' do
            expect{
                contacto_sin_nombre = Contacto.new("kimi","raikkonen",nil)
            }.to raise_exception(ExcepcionContacto)
        end
    end
end