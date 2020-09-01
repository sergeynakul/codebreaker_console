# frozen_string_literal: true

class SaveState < State
  def execute
    Codebreaker::Statistic.new(RESULTS_FILE).save(@console.game)
  end
end
