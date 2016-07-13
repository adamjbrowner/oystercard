class Oystercard

MINIMUM_BALANCE = 1
MAXIMUM_BALANCE = 90

attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
   fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if balance + amount > MAXIMUM_BALANCE
   @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "No funds available please top up" if balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
     @in_journey = false
  end

  def in_journey?
     @in_journey
  end
end
