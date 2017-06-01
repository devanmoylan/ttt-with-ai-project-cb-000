
# The Game class is the engine that connects players and the board
class Game

  attr_accessor :board, :player_1, :player_2

  # Class Constant for winning combinations
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  #When a game is initialized, the default is to create to human players in the params, or else the players will be passed in as arguments.
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #call the board instance class method to get the turn count and see if it's even. If even, player 1, else, player 2.
  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end


  def over?
    @board.full? || won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      x_count = 0
      o_count = 0
      combo.each do |c|
        if board.cells[c] == "X"
          x_count = x_count + 1
        elsif board.cells[c] == "O"
          o_count = o_count + 1
        end
      end
      return true if x_count == 3 || o_count == 3
    end
    false
  end

  def draw?
    @board.full? && !self.won?
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      x_count = 0
      o_count = 0
      combo.each do |c|
        if board.cells[c] == "X"
          x_count = x_count + 1
        elsif board.cells[c] == "O"
          o_count = o_count + 1
        end
      end
      if x_count == 3
        return "X"
      elsif o_count == 3
        return "O"
      end
    end
    return nil
  end

  def turn
    puts "Where would you like to go? [1-9]"
    input = current_player.move(board).to_i
    @board.valid_move?(input) ? @board.update(input, current_player) : turn
    @board.display
    self.current_player
  end

  def play
    until self.over? do
      self.turn
    end
    puts "Congratulations X!" if winner == "X"
    puts "Congratulations O!" if winner == "O"
    puts "Cat's Game!" if draw?
  end

end
