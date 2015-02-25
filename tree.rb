require "./nested_node"
require "./node"
require "./logic_node"
require 'rails'

class Tree

	attr_accessor :criteria

	def initialize(criteria = {})
		self.criteria = criteria
	end

	def nodes
		criteria.map do |key, value|
			if nested_field?(key) 
				NestedNode.new(key, value)
			else
			 logic_node?(key,value)
			end
		end.compact
	end

	def logic_node?(key,value)
		return LogicNode.new(key, value).deserialize if logics.include?(key)
		return Node.new(key, value).deserialize
	end

	def nested_field?(field)
		field.include?(".")
	end

	def logics
		@logics ||= ["$or","$and","$not","$nor"]
	end

end


tree = Tree.new({
	"archived"=>false, 
	"provider_id"=>"543689d468ee000a74000001", 
	"is_reserved"=>{"$ne"=>true}, 
	"pages_count"=>123, 
	"sender_country"=>"548efab12981000003000001", 
	"sender_phone"=>"89176464", 
	"receiver_name"=>/Майданов/i, 
	"receipt_date"=>{"$gte"=>"2015-02-20 00:00:00 UTC", "$lte"=>"2015-02-27 00:00:00 UTC"},
	"answer_notifications.addressed_to_id"=>{"$all"=>["51bae98ef27369f77500017b", "51bace4af273695ed1000128"]}, 
	"themes"=>{"$in"=>["543685ff3058000673000001", "547d8d77fcbb0002a3000001", "547703983c53000184000001"]},
	"$or"=>[{"provider_id"=>1, "_id"=>{"$in"=>[1, 2]}}]
})

puts tree.nodes