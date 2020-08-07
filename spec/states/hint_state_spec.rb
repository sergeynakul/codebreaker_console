# frozen_string_literal: true

RSpec.describe HintState do
  describe '#execute' do
    let(:console) { Console.new(described_class) }
    let(:state) { described_class.new(console) }
    let(:user) { Codebreaker::User.new('Ivan') }

    after do
      state.execute
    end

    it 'change state on MenuState' do
      console.game = Codebreaker::Game.new(user, :easy, Codebreaker::Codemaker.new.generate_secret_code)
      expect(state).to receive(:change_state).with(MenuState)
    end

    it 'change state on GuessState when no hint left' do
      console.game = Codebreaker::Game.new(user, :hell, Codebreaker::Codemaker.new.generate_secret_code)
      expect(state).to receive(:change_state).with(GuessState)
    end
  end
end
