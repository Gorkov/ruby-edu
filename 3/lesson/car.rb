class Car
  # attr_writer :speed
  # attr_reader :speed
  attr_accessor :speed
  
  attr_reader :engine_volume
  
  def initialize(max_speed = 100, engine_volume = 2.0)
    @max_speed = max_speed
    @engine_volume = engine_volume
    @speed = 0
  end
  
  # def set_speed(speed)
  #   @speed = speed
  # end
  #
  # def speed=(speed)
  #   @speed = speed
  # end
  
  # def speed
  #   @speed
  # end
  
  # def engine_volume
  #   @engine_volume
  # end
  
  def start_engine
    puts 'start'
    beep
  end
  
  def stop
    # @speed = 0
    self.speed = 0
  end
  
  def max
    # @speed = @max_speed
    self.speed = @max_speed
  end
  
  def beep
    puts 'Beep beep'
  end
end
