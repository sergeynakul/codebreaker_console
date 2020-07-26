# frozen_string_literal: true

class MenuState < State
  def execute
    puts 'Enter guess, hint or exit'
    case gets.chomp
    when 'guess' then change_state(GuessState)
    when 'hint' then change_state(HintState)
    when 'exit' then exit
    else
      puts 'You have passed unexpected command. Please choose one from listed commands'
      change_state(MenuState)
    end
  end
end
