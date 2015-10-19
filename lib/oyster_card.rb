class OysterCard

  MAX_BALANCE = 90.00

  attr_reader :balance

  def initialize starting_balance
    @balance = starting_balance
  end

  def top_up amount
    raise 'Top Up Failed - Over Max Balance' if over_max_balance? amount
    @balance += amount
  end

  private

  def over_max_balance? amount
    (balance + amount) > MAX_BALANCE
  end

end
