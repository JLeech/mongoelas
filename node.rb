require "./common_node"
require "./estring"
require "./efixnum"
require "./ehash"
require "./ebool"
class Node < CommonNode

	attr_accessor :value
	attr_accessor :type

	def parse
		val_class = @value_text.class
		if val_class == String
			@value = Estring.new(@value_text)
		elsif val_class == Fixnum
			@value = Efixnum.new(@value_text)
		elsif val_class == Hash
			@value = Ehash.new(@value_text)
		elsif val_class == ( FalseClass || TrueClass)
			@value = Ebool.new(@value_text)
		end
	end

end