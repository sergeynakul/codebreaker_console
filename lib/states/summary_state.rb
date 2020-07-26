# frozen_string_literal: true

class SummaryState < State
  def execute
    game = @console.game
    puts "Correct answer is #{game.secret_code}"
    if game.lose?
      puts 'You have not any attempts left'
    else
      puts 'You win! Want to save result?(yes/no)'
      change_state(SaveState) if gets.chomp == 'yes'
    end
    play_again? ? change_state(RegistrationState) : exit
  end

  private

  def play_again?
    puts 'Want start a new game?(yes/no)'
    gets.chomp == 'yes'
  end
end
