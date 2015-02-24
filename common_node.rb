class CommonNode

	attr_accessor :field
	attr_accessor :value_text

	def initialize(field,value)
		@field = field
		@value_text = value
	end

	def parse
	end


end
