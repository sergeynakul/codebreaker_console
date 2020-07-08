# frozen_string_literal: true

require 'codebreaker'

class Interface
  def welcome
    puts 'Welcome! Please enter one of several possible scenarios: start, rules, stats, exit'
    case gets.chomp
    when 'start' then start
    when 'rules' then rules
    when 'stats' then stats
    when 'exit' then exit
    else
      puts 'You have passed unexpected command. Please choose one from listed commands'
      welcome
    end
  end

  def start
    user = user_registration
    game_registration(user)
  rescue ::ValidationError => e
    puts e.message
    retry
  end

  def user_registration
    puts 'Enter your name'
    name = gets.chomp
    exit_if(name)
    Codebreaker::User.new(name)
  end

  def game_registration(user)
    puts 'Choose the difficulty(easy, medium or hell)'
    difficulty = gets.chomp
    exit_if(difficulty)
    @game = Codebreaker::Game.new(user, difficulty.to_sym, Codebreaker::Codemaker.new.generate_secret_code)
    menu
  end

  def exit_if(value)
    exit if value == 'exit'
  end

  def exit
    abort('Goodbye')
  end

  def menu
    puts 'Enter guess, hint or exit'
    case gets.chomp
    when 'guess' then guess
    when 'hint' then hint
    when 'exit' then exit
    else
      puts 'You have passed unexpected command. Please choose one from listed commands'
      menu
    end
  end

  # rubocop:disable Metrics/AbcSize
  def guess
    puts 'Enter your guess'
    numbers = gets.to_i
    guess_results = @game.check(Codebreaker::Guess.new(numbers).numbers)
    puts '+' * guess_results[:in_plase] + '-' * guess_results[:out_of_place]
    return game_summary(:win) if @game.win?(numbers)
    return game_summary(:lose) if @game.lose?

    next_step
  rescue ValidationError => e
    puts e.message
    retry
  end

  def stats
    table = CSV.parse(File.read(RESULTS_FILE), converters: :numeric)
    table.sort! { |x, y| x[5] <=> y[5] }.sort! { |x, y| x[3] <=> y[3] }
         .sort! { |x, y| DIFF_ARRAY.index(x[1]) <=> DIFF_ARRAY.index(y[1]) }
    table.each_with_index { |row, index| puts "#{index + 1}. #{row.join(', ')}" }
    welcome
  end
  # rubocop:enable Metrics/AbcSize

  def hint
    if @game.any_hints_left?
      puts @game.take_hint
      next_step
    else
      puts 'Any hints left'
      guess
    end
  end

  def next_step
    @game.any_hints_left? ? menu : guess
  end

  def game_summary(result)
    puts "Correct answer is #{@game.secret_code}"
    if result == :win
      puts 'You win! Want to save result?(yes/no)'
      @game.save_result if gets.chomp == 'yes'
    else
      puts 'You have not any attempts left'
    end
    puts 'Want start a new game?(yes/no)'
    gets.chomp == 'yes' ? start : exit
  end

  def rules
    File.readlines(RULES_FILE).each do |line|
      puts line
    end
    welcome
  end
end

Interface.new.welcome
