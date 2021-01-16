require "pry"
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells=[" "," "," "," "," "," "," "," "," ",]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
     @cells.all? {|square| square!=" "}
  end

  def turn_count
    cells.count {|cell| cell=="X" || cell=="O"}
  end

  def taken?(input)
    position(input)=="X" || position(input)=="O"
  end

  def valid_move?(input)
    num_input=input.to_i
    !taken?(num_input) && num_input.between?(1,9)
  end

  def update(input, player)
    num_input=input.to_i
    @cells[num_input-1]=player.token
  end

end