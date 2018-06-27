class RemitenteException < Exception

    def initialize(msg='El remitente no puede ser nil o vacio.')
        super
    end

end