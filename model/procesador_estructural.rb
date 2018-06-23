class ProcesadorEstructural

	attr_accessor :estructura

	#Crea una estructura general con un hash pasado por parametro
	def crear_estructura(informacion)
		@estructura = OpenStruct.new(informacion)
	end
end