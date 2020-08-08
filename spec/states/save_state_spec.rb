# frozen_string_literal: true

RSpec.describe SaveState do
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

    it 'change save game' do
      stub_const('RESULTS_FILE', 'spec/fixtures/results_file.yml')
      allow(Codebreaker::Statistic.new(RESULTS_FILE)).to receive(:save).with(console.game)
    end
  end
end
