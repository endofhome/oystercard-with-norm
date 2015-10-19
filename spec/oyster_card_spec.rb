require 'oyster_card'

describe OysterCard do
  context 'Balances' do
    it { is_expected.to respond_to(:balance) }
  end
end
