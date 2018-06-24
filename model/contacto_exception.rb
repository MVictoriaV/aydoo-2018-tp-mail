class ContactoException < Exception

    def initialize(msg='No puede crearse contacto por datos faltantes')
        super
    end

end