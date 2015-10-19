class OysterCard

  MAX_BALANCE = 90.00

  attr_reader :balance

  def initialize starting_balance
    @balance = starting_balance
    @in_journey = false
  end

  def top_up amount
    raise "Top Up Failed - Max Balance #{OysterCard::MAX_BALANCE}" if over_max_balance? amount
    @balance += amount
  end

  def deduct amount
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  private

  def over_max_balance? amount
    (balance + amount) > MAX_BALANCE
  end

end
