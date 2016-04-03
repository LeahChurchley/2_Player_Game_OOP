
class Player
  def initialize (name, lives, points)
    @name = name
    @lives = lives
    @points = points
  end

  attr_accessor :name, :lives, :points
  
  def gain_a_point
    @points += 1
  end
  
  def lose_a_life
    @lives -= 1
  end

  def ask_a_question
    num_1 = (1..20).to_a.sample
    num_2 = (1..20).to_a.sample
   
    puts "#{@name}: What is #{num_1} + #{num_2}?"
    
    player_answer = gets.chomp.to_i
    return player_answer == num_1 + num_2
  end

end

player_1 = Player.new("Leah", 3, 0)
player_2 = Player.new("Ross", 3, 0)

@players = [player_1, player_2]

def math_game
  current_player = 0
  while @players[0].lives > 0 && @players[1].lives > 0

    correct_answer = @players[current_player].ask_a_question
    if correct_answer
      @players[current_player].gain_a_point
       puts "Correct! #{@players[0].name}'s points = #{@players[0].points} and #{@players[1].name}'s points = #{@players[1].points}."
    else
      @players[current_player].lose_a_life
      puts "Wrong! #{@players[0].name} has #{@players[0].lives} lives left and #{@players[1].name} has #{@players[1].lives} lives left."
    end
    
    if current_player == 0
      current_player = 1
    elsif current_player == 1
      current_player = 0
    end

  end
  
  puts "Game over man! Game over!"
end

math_game()



 

