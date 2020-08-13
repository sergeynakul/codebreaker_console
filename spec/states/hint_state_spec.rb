# frozen_string_literal: true

RSpec.describe HintState do
  describe '#execute' do
    include_context 'with common'
    include_context 'when set game'

    it 'change state on MenuState' do
      expect(state).to receive(:change_state).with(MenuState)
    end

    it 'change state on GuessState when no hint left' do
      allow(console.game).to receive(:any_hints_left?).and_return(false)
      expect(state).to receive(:change_state).with(GuessState)
    end
  end
end
