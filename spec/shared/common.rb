# frozen_string_literal: true

RSpec.shared_context 'with common' do
  subject(:state) { described_class.new(console) }

  let(:console) { Console.new(described_class) }

  let(:user) { Codebreaker::User.new('Ivan') }

  after do
    state.execute
  end
end
