class RailwayStation
  attr_accessor :name, :trains
  
  def initialize(name, trains = [])
    @name = name
    @trains = trains
  end

  def trains_by_type(type = nil)
    trains_by_type = @trains.group_by(&:type)
    trains_by_type = trains_by_type[type] if type
    trains_by_type
  end
  
  def sent_train(train)
    @trains = @trains - train
  end
end

class Route
  attr_accessor :railway_stations
  
  def initialize(railway_stations = [])
    @railway_stations = railway_stations
  end
  
  def remove_station(railway_station)
    @railway_stations = @railway_stations - railway_station
  end
  
  def add_station(railway_station)
    @railway_stations = @railway_stations + railway_station
  end
  
  def first_station=(station)
    @railway_stations[0] = station
  end
  
  def first_station
    @railway_stations.first
  end
  
  def last_station=(station)
    @railway_stations[-1] = station
  end
  
  def last_station
    @railway_stations.last
  end
end

class Train
  PASSENGER_TYPE = 'passenger'
  CARGO_TYPE = 'cargo'
  TRAIN_TYPES = [PASSENGER_TYPE, CARGO_TYPE]
  
  attr_accessor :type, :wagon_count, :speed, :route, :current_station
  
  def initialize(type = PASSENGER_TYPE, wagon_count = 0)
    @type = type
    @wagon_count = wagon_count
    @speed = 0
  end
  
  def attach_wagon
    @wagon_count += 1
  end

  def detach_wagon
    @wagon_count -= 1
  end

  def go_next_station
    self.current_station = show_next_station
  end
  
  def show_prev_station
    self.route.railway_stations[self.route.railway_stations.find_index(@current_station) - 1]
  end

  def show_next_station
    self.route.railway_stations[self.route.railway_stations.find_index(@current_station) + 1]
  end
end
