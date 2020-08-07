# frozen_string_literal: true

RSpec.describe State do
  describe '#execute' do
    let(:state) { described_class.new(Integer) }

    it 'raise NotImplementedError' do
      expect { state.execute }.to raise_error(NotImplementedError)
    end
  end
end
