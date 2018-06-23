class EtiquetaEmptyConPrimerArgumentoNuloException < Exception

    def initialize(msg='El primer argumento de la etiqueta nil es nulo.')
        super
    end

end