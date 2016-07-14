class Journey

  attr_reader :current_journey

  def initialize
    @current_journey = {}
  end

  def entrance(station)
    @current_journey[:entry_station] = station
  end

  def finish(exit_station)
    @current_journey[:exit_station] = exit_station
  end

  def complete?
    (@current_journey[:entry_station] != nil) && (@current_journey[:exit_station] != nil)
  end

  def touch_in_fare
    if complete?
      1
    else
      6
    end
  end

  def touch_out_fare
    if complete?
      6
    else
      1
    end
  end

end
