class CargoTrain < Train
  attr_reader :type

  def initialize(wagons)
    super(wagons)
    @type = 'cargo'
  end
end