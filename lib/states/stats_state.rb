# frozen_string_literal: true

class StatsState < State
  def execute
    sorted_stats = Codebreaker::Sorter.new(Codebreaker::Statistic.new(RESULTS_FILE).read).call
    index = 0
    while index < sorted_stats.count
      puts "#{index + 1}. #{sorted_stats[index].values.join(', ')}"
      index += 1
    end
    change_state(WelcomeState)
  end
end
