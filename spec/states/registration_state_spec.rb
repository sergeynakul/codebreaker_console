# frozen_string_literal: true

RSpec.describe RegistrationState do
  describe '#execute' do
    let(:console) { Console.new(described_class) }
    let(:state) { described_class.new(console) }
    let(:success_name_input) { 'Ivan' }
    let(:success_difficulty_input) { 'hell' }
    let(:success_inputs) { [success_name_input, success_difficulty_input] }

    it 'receive success inputs and change state on MenuState' do
      allow(state).to receive_message_chain(:gets, :chomp).and_return(*success_inputs)
      expect(state).to receive(:change_state).with(MenuState)
      state.execute
    end
  end
end
