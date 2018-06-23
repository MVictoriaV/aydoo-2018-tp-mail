require_relative 'armador_de_etiqueta_date'

class ArmadorDePlantilla

	def armar(plantilla) 
		expresion = /[<]+([a-z]|[a-z]+[_])+[>]/
		una_etiqueta = plantilla.match(expresion)
		if una_etiqueta != nil
			plantilla = plantilla.gsub!(expresion) {|etiqueta| etiqueta.gsub(/[<>]/, '<' => '<%=@item.', '>' => '%>')}
		end
		return plantilla
	end
end