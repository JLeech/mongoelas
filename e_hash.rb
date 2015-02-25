class EHash

	attr_accessor :raw_hash

	def initialize(raw_hash)
		self.raw_hash = raw_hash
	end

	def deserialize(field)
		case
		when is_incoming?
		  { "match" => { "#{field}" => deserialize_incoming } }  
		when is_range?
		 	{ "range" => { "#{field}" => deserialize_range } }
		end
	end

	def deserialize_incoming
		key = raw_hash.keys.first
		values = raw_hash[key].join(" ")
		return {"query" => values, "operator" => "or"} if ["$in", "$nin"].include?(key) 
		return {"query" => values, "operator" => "and"} if key == "$all"		
	end

	def deserialize_range
		range_hash = {}
		raw_hash.each do |key, value|
			value = 
			range_hash["#{key}".gsub("$", "")] = value
		end
		range_hash
	end

	def is_negative?
		@is_negative ||= !(negatives & keys).empty?
	end

	def is_range?
		@is_range ||= !(ranges & keys).empty?
	end

	def is_incoming?
		@is_incoming ||= !(incomings & keys).empty?
	end

	def is_function?
		@is_function ||= !(functions & keys).empty?
	end

private

	def keys
		@keys ||= raw_hash.keys
	end

	def functions
		@functions ||= ["$mod","$regex","$text","$where"]
	end

	def ranges
		@ranges ||= ["$gt","$gte","$lt","$lte"]
	end

	def incomings
		@incomings ||= ["$in","$nin","$all"]
	end

	def negatives
		@negatives ||= ["$ne","$nin","nor","not"]
	end

end