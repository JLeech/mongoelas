require "./common_node"
require "./e_string"
require "./e_fixnum"
require "./e_hash"
require "./e_false_class"
require "./e_true_class"

class LogicNode < CommonNode

	attr_accessor :value
	attr_accessor :type

	def query_class(element)
		"E#{query.class.to_s}".constantize.new(element)
	rescue NameError
		nil
	end

	def deserialize
		query.each do |elem|
			elem.deserialize(field)
	end

end