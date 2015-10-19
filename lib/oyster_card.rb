class OysterCard

  attr_reader :balance

  def initialize starting_balance
    @balance = starting_balance
  end

  def top_up amount
    balance + amount
  end

end
