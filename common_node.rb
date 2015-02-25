class CommonNode

	attr_accessor :field
	attr_accessor :query

	def initialize(field,query)
		self.field = field
		self.query = query
	end

	def query_class
		"E#{query.class.to_s}".constantize.new(query)
	rescue NameError
		nil
	end

	def deserialize
		query_class.deserialize(field) unless query_class.blank?
	end


end
