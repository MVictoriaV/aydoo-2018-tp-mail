module FormateadorFecha

	def aplicar_formato(formato, dia=Time.now)
		return dia.strftime(formato)
	end
end