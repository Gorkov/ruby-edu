class Train
  attr_accessor :route
  attr_reader :speed, :wagons, :current_station

  TRAIN_TYPES = %w[cargo passenger]

  def initialize(wagons)
    @wagons = wagons
    @speed = 0
    @current_station = nil
  end

  def wagon_count
    @wagons.count
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

  private

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