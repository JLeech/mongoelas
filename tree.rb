require "./nested_node"
require "./node"

class Tree

	attr_accessor :nodes
	attr_accessor :data


	def initialize(data = {})
		@data = data
		@nodes = []
	end

	def parse_data
		@data.each_key do |key|
			is_field_nested?(key) ? cur_node = NestedNode.new(key, @data[key]) : cur_node = Node.new(key, @data[key])
			cur_node.parse
			@nodes.push(cur_node)
		end
	end

	def is_field_nested?(field)
		field.include?(".")
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
	"themes"=>{"$in"=>["543685ff3058000673000001", "547d8d77fcbb0002a3000001", "547703983c53000184000001"]}
})

tree.parse_data