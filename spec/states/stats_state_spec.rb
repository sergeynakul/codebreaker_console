# frozen_string_literal: true

RSpec.describe StatsState do
  describe '#execute' do
    include_context 'with common'

    it 'change state on WelcomeState' do
      stub_const('State::RESULTS_FILE', 'spec/fixtures/results_file.yml')
      expect(state).to receive(:change_state).with(WelcomeState)
    end
  end
end
