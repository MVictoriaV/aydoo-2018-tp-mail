class EtiquetaTimeNoSoportadaException < Exception

    def initialize(msg='Existe una etiqueta time no soportada, no se realiza reemplazo sobre la misma.')
        super
    end

end