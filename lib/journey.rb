class Journey

  attr_reader :journeys

  def initialize
    @journeys = {}
  end

  def entry_station
    @journeys[:entry_station] = entry_station
  end
end
