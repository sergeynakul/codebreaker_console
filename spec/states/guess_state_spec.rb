# frozen_string_literal: true

RSpec.describe GuessState do
  describe '#execute' do
    include_context 'with common'
    include_context 'when set game'

    it 'receive guess and change state on MenuState' do
      allow(state).to receive_message_chain(:gets, :to_i) { 1234 }
      expect(state).to receive(:change_state).with(MenuState)
    end
  end
end
