class ArmadorDePlantilla

	def armar(plantilla) 
		expresion = /[<]+([a-z]|[a-z]+[_])+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(/[<>]/, '<' => '<%=', '>' => '%>')}
		end
		return plantilla
	end
end