# frozen_string_literal: true

RSpec.describe SummaryState do
  describe '#execute' do
    let(:console) { Console.new(described_class) }
    let(:state) { described_class.new(console) }
    let(:user) { Codebreaker::User.new('Ivan') }

    before do
      console.game = Codebreaker::Game.new(user, :hell, Codebreaker::Codemaker.new.generate_secret_code)
    end

    after do
      state.execute
    end

    it 'save result and exit' do
      allow(state).to receive_message_chain(:gets, :chomp) { %w[yes exit] }
      expect(state).to receive(:exit)
    end
  end
end
