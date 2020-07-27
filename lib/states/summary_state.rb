# frozen_string_literal: true

class SummaryState < State
  def execute
    game = @console.game
    puts I18n.t(:correct_answer, code: game.secret_code)
    if game.lose?
      puts I18n.t(:no_attempts)
    else
      puts I18n.t(:save_result)
      change_state(SaveState) if gets.chomp == I18n.t(:yes_answer)
    end
    play_again? ? change_state(RegistrationState) : exit
  end

  private

  def play_again?
    puts I18n.t(:new_game)
    gets.chomp == I18n.t(:yes_answer)
  end
end
