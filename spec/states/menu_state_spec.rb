# frozen_string_literal: true

RSpec.describe MenuState do
  describe '#execute' do
    let(:console) { Console.new(described_class) }
    let(:state) { described_class.new(console) }

    after do
      state.execute
    end

    [
      { comand: 'guess', new_state: GuessState },
      { comand: 'hint', new_state: HintState },
      { comand: 'unexpected comand', new_state: described_class }
    ].each do |way|
      it "receive #{way[:comand]} and change state on #{way[:new_state]}" do
        allow(state).to receive_message_chain(:gets, :chomp) { way[:comand] }
        expect(state).to receive(:change_state).with(way[:new_state])
      end
    end

    it 'receive exit and exit from game' do
      allow(state).to receive_message_chain(:gets, :chomp) { 'exit' }
      expect(state).to receive(:exit)
    end
  end
end
