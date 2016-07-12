
class Oystercard

  LIMIT = 90

  attr_reader :balance

 def initialize
    @balance = 0
 end

 def top_up(value)
   raise "Maximum balance of £#{LIMIT} reached" if @balance + value > LIMIT
   @balance += value
 end

end
