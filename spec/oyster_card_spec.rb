require 'oyster_card'

describe OysterCard do
  let(:starting_balance) {0.00}
  subject {described_class.new(starting_balance)}
  context 'Balances' do
    it { is_expected.to respond_to(:balance) }

    it 'expects the return value to be a float' do
      expect(subject.balance).to be_instance_of(Float)
    end

    it 'initializes the balance with a given value' do
      expect(subject.balance).to eq starting_balance
    end

  end
end
