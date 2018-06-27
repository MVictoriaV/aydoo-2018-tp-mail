class ServicioDeMailException < Exception

    def initialize(msg='El servicio SMPT no se encuentra disponible.')
        super
    end

end