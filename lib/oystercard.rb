class Oystercard

MINIMUM_BALANCE = 1
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

attr_reader :balance, :entry_station, :stations, :journeys

  def initialize
    @balance = 0
    @stations = []
    @journeys = {}
  end

  def top_up(amount)
   fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if balance + amount > MAXIMUM_BALANCE
   @balance += amount
  end

  def touch_in(entry_station)
    fail "No funds available please top up" if balance < MINIMUM_BALANCE
    @stations << entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @stations << exit_station
    journey
  end

  def journey
    @journeys[:journey_1] = @stations
  end

  def in_journey?
     !@entry_station.nil?
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
