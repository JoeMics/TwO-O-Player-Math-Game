# QUESTION
# This class will be responsible for generating a question. It will also be 
# responsible for stating whether or not the question is answered correctly
# or incorrectly, and keeping track of which player in answering.

class Question
  attr_accessor :first_number, :second_number, :answered_correctly
  attr_reader :question, :correct_answer

  def initialize
    @first_number = rand(1...20)
    @second_number = rand(1...20)
    @question = "What does #{self.first_number} plus #{self.second_number} equal?"
    @correct_answer = self.first_number + self.second_number
    @answered_correctly = false
  end
  
  def correct_result
    self.answered_correctly = true
    puts 'YES! You are correct.'
  end

  def incorrect_result
    puts 'Seriously? No!'
  end

  def prompt_question
    answer = gets.chomp

    if answer.to_i === self.correct_answer
      self.correct_result
    else
      self.incorrect_result
    end
  
  end
end