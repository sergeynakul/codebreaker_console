# frozen_string_literal: true

module Stats
  RESULTS_FILE = 'lib/files/results_file.csv'
  DIFF_ARRAY = %w[hell medium easy].freeze

  def stats_table
    table = read_file
    sorted_table = sort_by_hints(table)
    sorted_table = sort_by_attempts(sorted_table)
    sorted_table = sort_by_difficulties(sorted_table)
    sorted_table
  end

  private

  def read_file
    CSV.parse(File.read(RESULTS_FILE), converters: :numeric)
  end

  def sort_by_hints(table)
    table.sort_by { |row| row[5] }
  end

  def sort_by_attempts(sorted_table)
    sorted_table.sort_by { |row| row[3] }
  end

  def sort_by_difficulties(sorted_table)
    sorted_table.sort_by { |row| DIFF_ARRAY.index(row[1]) }
  end
end
