# PLAYER
# This class will be responsible for keeping track of a player's lives.

class Player
  attr_accessor :lives, :name

  def initialize(name)
    @lives = 3
    @name = name
  end

  def lose_life
    self.lives -= 1
  end
end
