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
  
  attr_accessor :start_pos, :tree, :visited_pos
  
  def initialize(start_pos=[0,0])
    @start_pos = start_pos
    @visited_pos = [start_pos]
    @tree = PolyTreeNode.new(start_pos)
  end
  
  def valid_moves(pos)
    DELTA.select do |move|
      (pos.first + move[0]).between?(0, 7) &&
      (pos.last + move[1]).between?(0, 7)
    end
  end
  
  def new_move_pos(pos)
    all_moves = valid_moves(pos).map do |move| 
      [move[0] + pos[0], move[1] + pos[1]]
    end 
    new_moves = all_moves.reject { |move| @visited_pos.include?(move) }
    @visited_pos += new_moves 
    new_moves
  end 
  
  def build_move_tree
    current_pos = @tree
    counter = 0
    children = new_move_pos(start_pos)
    until @visited_pos.length == 64
      children.each_with_index do |move, idx|
        a = PolyTreeNode.new(move)
        current_pos.add_child(a)
      end
      current_pos = current_pos.children[counter]
      children = new_move_pos(current_pos)
      counter += 1
      binding.pry
      
    end
    
    @tree
  end
  
end

a = KnightPathFinder.new([3, 3])
a.build_move_tree

