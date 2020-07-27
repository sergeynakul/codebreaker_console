# frozen_string_literal: true

class WelcomeState < State
  def execute
    puts I18n.t(:welcome)
    case gets.chomp
    when I18n.t(:start) then change_state(RegistrationState)
    when I18n.t(:rules) then change_state(RulesState)
    when I18n.t(:stats) then change_state(StatsState)
    when I18n.t(:exit) then exit
    else
      puts I18n.t(:unexpected_command)
      change_state(WelcomeState)
    end
  end
end
