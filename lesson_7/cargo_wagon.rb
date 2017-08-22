require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :all_volume, :free_volume, :busy_volume

  def initialize(number, all_volume)
    super(number, "Cargo")
    @all_volume = all_volume
    @free_volume = all_volume
    @busy_volume = 0
  end

  def take_volume(volume)
    @free_volume -= volume
    @busy_volume += volume
  end
end
