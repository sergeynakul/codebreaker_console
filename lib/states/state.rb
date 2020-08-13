# frozen_string_literal: true

class State
  RESULTS_FILE = 'lib/files/results_file.yaml'

  attr_accessor :console

  def initialize(console)
    @console = console
  end

  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  private

  def change_state(new_state)
    console.state = new_state
    console.state.execute
  end

  def unexpected_comand(state)
    puts I18n.t(:unexpected_comand)
    change_state(state)
  end

  def hints_check
    @console.game.any_hints_left? ? change_state(MenuState) : change_state(GuessState)
  end

  def exit_if(value)
    exit if value == I18n.t(:exit)
  end

  def exit
    abort(I18n.t(:goodbye))
  end
end
