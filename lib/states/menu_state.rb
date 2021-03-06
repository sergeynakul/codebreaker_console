# frozen_string_literal: true

class MenuState < State
  def execute
    puts I18n.t(:menu_choose)
    case gets.chomp
    when I18n.t(:guess) then change_state(GuessState)
    when I18n.t(:hint) then change_state(HintState)
    when I18n.t(:exit) then exit
    else
      unexpected_comand(self.class)
    end
  end
end
