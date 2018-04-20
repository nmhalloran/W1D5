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
  
  attr_accessor :pos
  
  def initialize(pos=[0,0])
    @pos = pos
    @visited_pos = [pos]
  end
  
  def valid_moves
    DELTA.select do |move|
      (pos.first + move[0]).between?(0, 7) &&
      (pos.last + move[1]).between?(0, 7)
    end
  end
  
  def new_move_pos
    all_moves = valid_moves.map do |move| 
      [move[0] + pos[0], move[1] + pos[1]]
    end 
    new_moves = all_moves.reject { |move| @visited_pos.include?(move) }
    @visited_pos += new_moves 
    new_moves
  end 
  
  def build_move_tree
        
  end
  
end

a = KnightPathFinder.new([3, 3])
# p a.valid_moves
p a.new_move_pos