class Wagon
  attr_reader @number

  def initialize(number)
    @number = number
  end

  def number= (number)
    self.number = number
  end
end