# frozen_string_literal: true

class RulesState < State
  RULES_FILE = 'lib/files/rules.txt'

  def execute
    File.readlines(RULES_FILE).each do |line|
      puts line
    end
    change_state(WelcomeState)
  end
end
