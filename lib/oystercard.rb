class Oystercard

MINIMUM_BALANCE = 1
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    # @in_journey = false
  end

  def top_up(amount)
   fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if balance + amount > MAXIMUM_BALANCE
   @balance += amount
  end

  def touch_in(entry_station)
    fail "No funds available please top up" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
     !@entry_station.nil?
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
