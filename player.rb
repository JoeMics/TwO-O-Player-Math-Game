# PLAYER
# This class will be responsible for keeping track of a player's lives.

class Player

  def initialize()
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end
end
