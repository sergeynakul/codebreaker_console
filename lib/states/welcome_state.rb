# frozen_string_literal: true

class WelcomeState < State
  def execute
    puts 'Welcome! Please enter one of several possible scenarios: start, rules, stats, exit'
    case gets.chomp
    when 'start' then change_state(RegistrationState)
    when 'rules' then change_state(RulesState)
    when 'stats' then change_state(StatsState)
    when 'exit' then exit
    else
      puts 'You have passed unexpected command. Please choose one from listed commands'
      change_state(WelcomeState)
    end
  end
end
