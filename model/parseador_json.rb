require 'json'

class ParseadorJson

	def parsear?(un_json)
	  
	  if un_json == nil || un_json.empty?
	  	return false
	  end
	  return true
	end
end