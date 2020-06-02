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

  def take_up_route(route)
    @route = route
    @current_station = route.first_station
  end

  def pick_up_speed
    @speed += 1
  end

  def stop
    @speed = 0
  end

  def attach_wagon
    return unless self.in_move?
    @number_of_wagons += 1
  end

  def detach_wagon
    return unless self.in_move?
    @number_of_wagons -=1
  end

  def move_on_route
    return unless self.station_ahead?

    @current_station = @route[self.current_station_number + 1]
  end

  def previous_station
    return unless self.station_behind?

    @route[self.current_station_number - 1]
  end

  def current_station
    @current_station
  end

  def next_station
    return unless self.station_ahead?

    @route[self.current_station_number + 1]
  end

  def current_station_number
    @route.find_index(@current_station)
  end

  def station_ahead?
    @route.length > self.current_station_number + 1
  end

  def station_behind?
    self.current_station_number > 0
  end

  def in_move?
    @speed > 0
  end

end