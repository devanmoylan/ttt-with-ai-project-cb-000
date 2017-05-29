

class Board

  #The board has cells 0 - 8 and one game
  attr_accessor :cells, :game

  #The board is given any empty array upon initialization to store player moves in.
  def initialize
    @cells = Array.new(9, " ")
  end

  #The board can be reset at any point; this initializes a new empty array.
  def reset!
    @cells = Array.new(9, " ")
  end

  #The display instance method is used to display the cells and the tokens that occupy each cell.
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end



  #The instance method of full? checks all the cells to see if they are occupied by either an X or O
  def full?
    @cells.all? {|i| i == "O" || i == "X"}
  end

  #Turn count goes through the cell's array and selects all the indexs with either an X or O, then counts them all.
  def turn_count
    @cells.select {|i| i == "O" || i == "X"}.count
  end

  #Taken instance method takes in the users input and passes it into the position instance method to gather the right index and check if the value is equal to either X or O
  def taken?(input)
    position(input) == "O" || position(input) == "X"
  end

  #Valid_move instance method checks to see if the input is first taken or not and then checks to see if the input is between 1,9.
  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  #The instance method of position takes the user input and converts the input to correspond to the appropriate index.
  def position(input)
    @cells[input.to_i - 1]
  end

  #The board is then updated at the appropriate position by using the position method and shovels in the player.token. lstrip! is used to eliminate the space at the front of the string.
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end
