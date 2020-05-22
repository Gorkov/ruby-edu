class Route
  def initialize(station_list = [])
    @stations_list = station_list
  end

  def add_station(station)
    @stations_list << station
  end

  def remove_station
    @stations_list.delete(station)
  end

  def show_list
    p @stations_list
  end
end

class RailwayStation
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def trains
    self.trains
  end

  def current_trains
    self.trains.select{|train| train[:current_station] == self}
  end

  def trains_by_type(type)
    return unless Train::TRAIN_TYPES.include?(type)

    self.trains.select{|train| train[:type] == type}
  end

  def take_trains(train)
    @trains << train
  end

  def send_trains(train)
    @trains.delete(train)
  end
end

class Train
  attr_accessor :route
  attr_reader :speed, :number_of_wagons

  TRAIN_TYPES = %w[cargo passenger]

  def initialize(type, number_of_wagons)
    return unless TRAIN_TYPES.include?(type)
    @type = type
    @number_of_wagons = number_of_wagons
    @speed = 0
    @current_station = nil
  end

  def set_up_route(route)
    @route = route
  end

  def pick_up_speed

  end

  def attach_wagon
    ++@number_of_wagons
  end

  def detach_wagon
    --@number_of_wagons
  end

  def move
    @current_station = nil
  end

  def move_on_route
    current_station_number = @route.find_index(@current_station)
    return unless @route.length > current_station_number

    @current_station = @route[current_station_number + 1]
  end

end