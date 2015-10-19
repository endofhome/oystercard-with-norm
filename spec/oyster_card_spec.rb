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

  context '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'adds the amount to the balance' do
      expect(subject.top_up(100.00)).to eq (starting_balance + 100.00)
    end

    it 'stores the new balance after topping up' do
      subject.top_up(100.00)
      expect(subject.balance).to eq (starting_balance + 100.00)
    end
  end

end
