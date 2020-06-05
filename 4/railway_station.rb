class RailwayStation
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_trains(train)
    @trains << train
  end

  def send_trains(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    return unless Train::TRAIN_TYPES.include?(type)

    self.trains.select{|train| train[:type] == type}.count
  end
end