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