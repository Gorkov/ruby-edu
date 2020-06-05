class PassengerTrain < Train
  attr_reader :type

  def initialize(wagons)
    super(wagons)
    @type = 'passenger'
  end
end