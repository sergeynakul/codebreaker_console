# frozen_string_literal: true

RSpec.describe GuessState do
  describe '#execute' do
    let(:console) { Console.new(described_class) }
    let(:state) { described_class.new(console) }
    let(:user) { Codebreaker::User.new('Ivan') }

    before do
      console.game = Codebreaker::Game.new(user, :easy, Codebreaker::Codemaker.new.generate_secret_code)
    end

    after do
      state.execute
    end

    it 'receive guess and change state on MenuState' do
      allow(state).to receive_message_chain(:gets, :to_i) { 1234 }
      expect(state).to receive(:change_state).with(MenuState)
    end
  end
end
