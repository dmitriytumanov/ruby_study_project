# <Station> class.
# This class is used to control the station.

class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    self.trains << train
    puts "Train #{train.number} added to station #{self.name}"
  end

  def send_train(train)
    self.trains.delete(train)
    puts "Train #{train.number} removed from station #{self.name}"
  end

  def get_trains_at_station
    puts "Trains on station #{name}:"
    trains.each do |train|
      puts train.number
    end
  end

  def trains_by_type(type)
    puts "Trains with type #{type} on station #{name}:"
    trains.each do |train|
      puts train.number if train.type == type
    end
  end
end
