class EtiquetaNoSoportadaException < Exception

    def initialize(msg='Etiqueta sin comportamiento definido, no se realiza reemplazo sobre la misma.')
        super
    end

end