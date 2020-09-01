# frozen_string_literal: true

RSpec.describe SummaryState do
  describe '#execute' do
    include_context 'with common'
    include_context 'when set game'

    it 'save result and exit' do
      allow(state).to receive_message_chain(:gets, :chomp) { %w[yes exit] }
      expect(state).to receive(:exit)
    end
  end
end
