require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number)
    super(number, "Passenger")
  end
end
