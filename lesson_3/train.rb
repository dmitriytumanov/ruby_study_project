# <Train> class.
# This class is used to control the train.

class Train
  attr_accessor :number, :speed, :wagons, :type
  attr_reader :route

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def speed_up
    self.speed += 10
    puts "Train picked up speed. Current speed = #{self.speed}"
  end

  def stop
    self.speed = 0
    puts "Train stopped. Current speed = #{self.speed}"
  end

  def add_wagon
    if self.speed != 0
      puts "Stop train!!! Train is going at a speed #{self.speed} kph."
    else
      self.wagons += 1
      puts "You attach wagon. In this train there are #{self.wagons} wagons."
    end
  end

  def del_wagon
    if self.speed != 0
      puts "Stop train!!! Train is going at a speed #{self.speed} kph."
    elsif self.wagons > 0
      self.wagons -= 1
      puts "You unhook wagon. In this train there are #{self.wagons} wagons."
    end
  end

  def route=(route)
    @route = route
    @current_station_index = 0
    self.route.stations.first.take_train(self)
    puts "Route of this train is from #{self.route.start_station.name} to #{self.route.end_station.name}"
  end

  def move_next_station
    current_station.send_train(self)
    @current_station_index += 1
    current_station.take_train(self)
  end

  def move_previous_station
    current_station.send_train(self)
    @current_station_index -= 1
    current_station.take_train(self)
  end

  def get_current_station
    station = self.route.stations[@current_station_index]
    puts "Current station is #{station.name}"
    return station
  end

  def get_next_station
    station = self.route.stations[@current_station_index + 1]
    puts "Next station is #{station.name}"
    return station
  end

  def get_previous_station
    station = self.route.stations[@current_station_index - 1]
    puts "Previous station is #{station.name}"
    return station
  end

  def current_station
    self.route.stations[@current_station_index]
  end
end
