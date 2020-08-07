# frozen_string_literal: true

RSpec.describe Console do
  let(:console) { described_class.new }

  it '#start' do
    expect(console.state).to receive(:execute)
    console.start
  end

  it '#state=' do
    console.state = RegistrationState
    expect(console.instance_variable_get(:@state)).to be_instance_of(RegistrationState)
  end
end
