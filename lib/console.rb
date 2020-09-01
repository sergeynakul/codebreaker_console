# frozen_string_literal: true

class Console
  attr_accessor :game
  attr_reader :state

  def initialize(state = WelcomeState)
    @state = state.new(self)
  end

  def state=(new_state)
    @state = new_state.new(self)
  end

  def start
    @state.execute
  end
end
