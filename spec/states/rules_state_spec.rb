# frozen_string_literal: true

RSpec.describe RulesState do
  describe '#execute' do
    include_context 'with common'

    it 'change state on WelcomeState' do
      expect(state).to receive(:change_state).with(WelcomeState)
    end
  end
end
