class CargoWagon < Wagon
  attr_reader @type

  def initialize(number)
    super(number)
    @type = 'passenger'
  end
end