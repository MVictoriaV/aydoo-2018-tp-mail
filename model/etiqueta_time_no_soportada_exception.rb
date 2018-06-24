class EtiquetaTimeNoSoportadaException < Exception

    def initialize(msg='Etiqueta time sin comportamiento definido, no se realiza reemplazo sobre la misma.')
        super
    end

end