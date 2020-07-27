# frozen_string_literal: true

class RegistrationState < State
  def execute
    user = user_registration
    game_registration(user)
  rescue ValidationError => e
    puts e.message
    retry
  end

  private

  def user_registration
    puts I18n.t(:enter_name)
    name = gets.chomp
    exit_if(name)
    Codebreaker::User.new(name)
  end

  def game_registration(user)
    puts I18n.t(:choose_difficulty)
    difficulty = gets.chomp
    exit_if(difficulty)
    @console.game = Codebreaker::Game.new(user, difficulty.to_sym, Codebreaker::Codemaker.new.generate_secret_code)
    change_state(MenuState)
  end
end
