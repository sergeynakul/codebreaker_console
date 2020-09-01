# frozen_string_literal: true

RSpec.shared_context 'when set game' do
  before do
    console.game = Codebreaker::Game.new(user, :easy, Codebreaker::Codemaker.new.generate_secret_code)
  end
end
