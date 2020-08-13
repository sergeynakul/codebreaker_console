# frozen_string_literal: true

RSpec.describe SaveState do
  describe '#execute' do
    include_context 'with common'
    include_context 'when set game'

    it 'change save game' do
      stub_const('RESULTS_FILE', 'spec/fixtures/results_file.yml')
      allow(Codebreaker::Statistic.new(RESULTS_FILE)).to receive(:save).with(console.game)
    end
  end
end
