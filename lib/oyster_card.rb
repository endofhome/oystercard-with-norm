class OysterCard

  MAX_BALANCE = 90.00
  MIN_BALANCE = 1.00

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
    raise "Unable to Touch In. Balance is below minimum: Balance #{balance}" if below_min_balance?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def over_max_balance? amount
    (balance + amount) > MAX_BALANCE
  end

  def below_min_balance?
    balance < MIN_BALANCE
  end

end
