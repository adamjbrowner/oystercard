
class Oystercard

  LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def top_up(value)
    raise "Maximum balance of £#{LIMIT} reached" if @balance + value > LIMIT
    @balance += value
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def deduct(fare)
    @balance -= fare
  end
end
