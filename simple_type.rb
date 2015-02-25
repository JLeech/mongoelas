class SimpleType

	attr_accessor :value

	def initialize(value)
		@value = value
	end

	def deserialize(field)
		return {"must" => {"match" => {"#{field}" => value}}}
	end

end