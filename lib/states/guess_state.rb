# frozen_string_literal: true

class GuessState < State
  IN_PLACE = '+'
  OUT_OF_PLACE = '-'

  def execute
    puts 'Enter your guess'
    numbers = gets.to_i
    game = @console.game
    puts guess_response(guess_results(game, numbers))
    return change_state(SummaryState) if game.win?(numbers) || game.lose?

    next_step
  rescue ValidationError => e
    puts e.message
    retry
  end

  private

  def guess_results(game, numbers)
    game.check(Codebreaker::Guess.new(numbers).numbers)
  end

  def guess_response(guess_results)
    IN_PLACE * guess_results[:in_plase] + OUT_OF_PLACE * guess_results[:out_of_place]
  end
end
