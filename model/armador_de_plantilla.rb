class ArmadorDePlantilla

	def armar(plantilla) 
		expresion = /[<]+([a-z]|[a-z]+[_])+[>]/
		plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(/[<>]/, '<' => '<%=@item.', '>' => '%>')}
	end
end