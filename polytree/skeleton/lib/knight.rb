require 'pry'
require 'byebug'
require_relative '00_tree_node'

class KnightPathFinder
  
  DELTA = [
            [-2,-1],
            [-1,-2],
            [-2, 1],
            [-1, 2],
            [ 1, 2],
            [ 2, 1],
            [ 2,-1],
            [ 1,-2]
          ]
  
  attr_accessor :start_pos
  
  def initialize(start_pos=[0,0])
    @start_pos = start_pos
  end
  
  
end