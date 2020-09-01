# frozen_string_literal: true

RSpec.describe WelcomeState do
  describe '#execute' do
    include_context 'with common'

    [
      { comand: 'start', new_state: RegistrationState },
      { comand: 'rules', new_state: RulesState },
      { comand: 'stats', new_state: StatsState },
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
