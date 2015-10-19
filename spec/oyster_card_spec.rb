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

  context 'Journey' do
    it { is_expected.to respond_to(:in_journey?) }

    it 'a new card is not in a journey' do
      expect(subject.in_journey?).to be false
    end

    it { is_expected.to respond_to(:touch_in) }

    it 'a card is in use once it has been touched in' do
      subject.touch_in
      expect(subject.in_journey?).to be true
    end

    it { is_expected.to respond_to(:touch_out) }

    it 'a card is no longer in use after it has been touched out' do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to be false
    end
  end

  context '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'adds the amount to the balance' do
      expect(subject.top_up(10.00)).to eq (starting_balance + 10.00)
    end

    it 'stores the new balance after topping up' do
      subject.top_up(10.00)
      expect(subject.balance).to eq (starting_balance + 10.00)
    end

    it 'raises an error if trying to top up above the maximum limit' do
      expect {subject.top_up(100.00)}.to raise_error "Top Up Failed - Max Balance #{OysterCard::MAX_BALANCE}"
    end
  end

  context 'Deducting a fare' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts the amount from the balance' do
      expect(subject.deduct(10.00)).to eq (starting_balance - 10.00)
    end

    it 'stores new balance after deducting fare' do
      subject.deduct(10.00)
      expect(subject.balance).to eq (starting_balance - 10.00)
    end
  end

end
