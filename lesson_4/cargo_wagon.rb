require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(number)
    super(number, "Cargo")
  end
end
