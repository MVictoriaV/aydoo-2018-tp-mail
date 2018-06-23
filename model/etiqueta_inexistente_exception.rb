class EtiquetaInexistenteException < Exception

    def initialize(msg='Faltan etiquetas las cuales son requeridas')
        super
    end

end