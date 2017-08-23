require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :all_volume, :free_volume, :busy_volume

  def initialize(number, all_volume)
    super(number, "Cargo")
    @all_volume = all_volume
    @free_volume = all_volume
  end

  def take_volume(volume)
    @free_volume -= volume if @free_volume >= volume
  end

  def get_busy_volume
    @all_volume - @free_volume
  end

  def to_s
    [@number, @type, @free_volume, get_busy_volume].join(' ')
  end
end
