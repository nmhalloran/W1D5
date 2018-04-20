require 'pry'
require 'byebug'

class PolyTreeNode
  
  attr_reader :value
  attr_accessor :children, :node_parent
  
  def initialize(value, node_parent = nil, children = [])
    @value = value
    @node_parent = node_parent 
    @children = children 
  end
  
  def parent=(node)
    # binding.pry
    old_parent = self.node_parent
    old_parent.children.delete(self) if old_parent
    
    self.node_parent = node
    return nil if node.nil?
    node.children << self unless node.children.include?(self)
    self
  end
  
  def parent 
    self.node_parent 
  end
  
  def add_child(node) 
    node.parent = self
  end
  
  def remove_child(node)
    raise "Not a child" if node.parent.nil?
    node.parent = nil
  end

end

class Searchable
  
  def defsen
end

