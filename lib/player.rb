

class Player

  attr_accessor :humans, :computers, :game
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def add_game(game)
    @game = game
  end

end
