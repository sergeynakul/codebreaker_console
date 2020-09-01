# frozen_string_literal: true

class RulesState < State
  def execute
    puts I18n.t(:game_rules, amount: Codebreaker::Codemaker::AMOUNT_OF_NUMBERS,
                             range: Codebreaker::Codemaker::RANGE_OF_NUMBERS,
                             plus: GuessState::IN_PLACE,
                             minus: GuessState::OUT_OF_PLACE)
    change_state(WelcomeState)
  end
end
