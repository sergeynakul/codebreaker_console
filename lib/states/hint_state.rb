# frozen_string_literal: true

class HintState < State
  def execute
    game = @console.game
    if game.any_hints_left?
      puts game.take_hint
      next_step
    else
      puts I18n.t(:no_hints)
      change_state(GuessState)
    end
  end
end
