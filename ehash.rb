class Ehash

	attr_accessor :raw_hash,:equals,:logic,:funcs

	protected :equals,:logic,:funcs


	def initialize(data)
		@raw_hash = data
		init_equals
		init_logic
		init_funcs
	end

	def parce
	end

	def init_funcs
		@funcs = ["$mod","$regex","$text","$where"]
	end

	def init_logic
		@logic = ["$or","$and","$not","$nor"]
	end

	def init_equals
		@equals = ["$gt","$gte","$lt","$lte","$ne","$in","$nin"]
	end


end