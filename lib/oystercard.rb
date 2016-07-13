class Oystercard

MINIMUM_BALANCE = 1
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

attr_reader :balance, :entry_station, :journeys

  def initialize
    @balance = 0
    @journeys = {}
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "No funds available please top up" if balance < MINIMUM_BALANCE
    @journeys[:entry_station] = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @journeys[:exit_station] = exit_station
  end

  def in_journey?
    @journeys.empty?
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
