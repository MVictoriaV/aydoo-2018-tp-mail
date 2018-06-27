class AsuntoInexistenteException < Exception

    def initialize(msg='El asunto no puede ser nil o vacio.')
        super
    end

end