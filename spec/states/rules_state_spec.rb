# frozen_string_literal: true

RSpec.describe RulesState do
  describe '#execute' do
    let(:console) { Console.new(described_class) }
    let(:state) { described_class.new(console) }

    after do
      state.execute
    end

    it 'change state on WelcomeState' do
      expect(state).to receive(:change_state).with(WelcomeState)
    end
  end
end
