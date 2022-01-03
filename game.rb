require './player'
require './question'

# GAME
# This  class will handle the current state of the game, and keep track of
# player's scores. It keeps track of whose turn it is.

class Game
  attr_reader :player1, :player2
  attr_accessor :current_player, :first_round

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = self.player1
    @first_round = true
  end

  def game_start
    until (self.player1.lives === 0 || self.player2.lives === 0)
      # Divider shows only after first round
      unless first_round
        puts '----- NEW TURN -----'
      end
      self.first_round = false

      # Ask user a question
      question = Question.new
      puts "#{current_player.name}: #{question.question}"
      print '> '
      question.prompt_question

      unless question.answered_correctly
        self.current_player.lose_life
      end

      # output player scores
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"

      self.switch_players
    end
    self.end_game
  end

  def switch_players
    if self.current_player === self.player1
      self.current_player = self.player2
    else
      self.current_player = self.player1
    end
  end

  def end_game
    puts '----- GAME OVER -----'
    unless player1.lives === 0
      puts "#{player1.name} wins with a score of #{player1.lives}/3"
    else
      puts "#{player2.name} wins with a score of #{player2.lives}/3"
    end
  end
end

game = Game.new
game.game_start