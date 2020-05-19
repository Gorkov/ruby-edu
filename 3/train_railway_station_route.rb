class RailwayStation
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = {}
  end

  def trains_by_type

  end

  def take_trains(train)
    @trains.merge(train)
  end

  def send_trains(train)
    @trains.delete(train)
  end
end
