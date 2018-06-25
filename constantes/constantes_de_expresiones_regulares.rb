module ConstantesDeExpresionesRegulares

	ETIQUETA_DATE = /[<]+([date]+[:]+[d|i])+[>]/
	ETIQUETA_EMPTY = /[<][empty]+[(].+[a-z].+,.+[a-z]+.[)]+[>]/
	ETIQUETA_SUM = /[<]+([sum(]+\d+,+\d+[)])+[>]/
end