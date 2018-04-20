require 'pry'

class Board

  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end
  
  def [](pos) 
    row, col = pos 
    grid[row][col]
  end 
  
  def []=(pos, value)
    row, col = pos 
    grid[row][col] = value
  end
  
  def render 
    puts "  #{(0..7).to_a.join(" ")}"
    grid.each_with_index do |row, idx| 
      puts "#{idx} #{row.join(" ")}"
    end 
  end  
  
end

a = Board.new 
a.render
