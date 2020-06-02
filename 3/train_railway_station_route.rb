class Route
  def initialize(station_list = [])
    @station_list = station_list
  end

  def add_station(station)
    @station_list << station
  end

  def remove_station
    @station_list.delete(station)
  end

  def first_station
    @station_list.first
  end

  def last_station
    @station_list.last
  end

  def interim_stations
    @station_list[1..-2]
  end

  def show_list
    puts @station_list
  end
end

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