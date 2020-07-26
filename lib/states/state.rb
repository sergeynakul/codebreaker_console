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

  def next_step
    @console.game.any_hints_left? ? change_state(MenuState) : change_state(GuessState)
  end

  def exit_if(value)
    exit if value == 'exit'
  end

  def exit
    abort('Goodbye')
  end
end
