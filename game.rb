require './player'
require './question'

# GAME
# This  class will handle the current state of the game, and keep track of
# player's scores. It keeps track of whose turn it is.

class Game
  attr_reader :player1, :player2
  attr_accessor :current_player

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = self.player1
  end

  def game_start
    until (self.player1.lives === 0 || self.player2.lives === 0)
      # Ask user a question
      question = Question.new
      puts "#{current_player.name}: #{question.question}"
      question.prompt_question

      unless question.answered_correctly
        self.current_player.lose_life
      end

      # output player scores
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"

      self.switch_players
    end
  end

  def switch_players
    if self.current_player === self.player1
      self.current_player = self.player2
    else
      self.current_player = self.player1
    end
  end
end

game = Game.new
game.game_start




#   initialize:
#     player1: new Player()
#     player2: new Player()
#     current_player: player1

#   methods:
#     game_start()

#       unless (player1.lives === 0 OR player2.lives === 0)
#         ask new Question()

#         if question is answered incorrectly
#           current_player.lose_life()
  
#         # Show current score
#         print "P1: x/3 vs P2: x/3"

#         switch_players()
      
#       game_end()

#     switch_players()
#       if current_player is player 1, current_player = 2,
#       if current_player is player2, current_player = 1

#     game_end()
#       if (player1.lives not === 0)
#         print "Player 1 wins with a score of player1.lives"
#       else
#         print "Player 2 wins with a score of player2.lives"
