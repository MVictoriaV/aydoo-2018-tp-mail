module ConstantesDeExpresionesRegulares

	ETIQUETA_DATE = /[<]+([date]+[:]+[d|i])+[>]/
	ETIQUETA_EMPTY = /[<][empty]+[(].+[a-z].+,.+[a-z]+.[)]+[>]/
	ETIQUETA_EMPTY_PRIMER_ARGUMENTO = /[a-z]+,/
	ETIQUETA_EMPTY_SEGUNDO_ARGUMENTO = /([a-z])+[)]/
	ETIQUETA_SUM = /[<]+([sum(]+\d+,+\d+[)])+[>]/
	ETIQUETA_SUM_PRIMER_ARGUMENTO = /\d+,/
	ETIQUETA_SUM_SEGUNDO_ARGUMENTO = /,+\d/
end