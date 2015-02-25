require "./common_node"
require "./e_string"
require "./e_fixnum"
require "./e_hash"
require "./e_false_class"
require "./e_true_class"

class Node < CommonNode

	attr_accessor :value
	attr_accessor :type

end