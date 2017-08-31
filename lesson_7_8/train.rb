require_relative 'manufacturer'

class Train
  include Manufacturer

  NUMBER_FORMAT = /^[а-я]{3}\d{3}-?[а-я]{2}\d{2}$/i
  TYPE_FORMAT = /Cargo|Passenger/

  attr_reader :speed, :number, :type, :route, :wagons

  @@trains_numbers = {}

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @speed = 0
    @wagons = []
    @@trains_numbers[number] = self
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def to_s
    [@number, @type, @wagons.size].join(' ')
  end

  def each_wagon
    @wagons.each { |wagon| yield(wagon) }
  end

  def self.find(number)
    @@trains_numbers[number]
  end

  def speed_up
    self.speed += 10
  end

  def stop
    self.speed = 0
  end

  def route=(route)
    @route = route
    @current_station_index = 0
    route.stations.first.take_train(self)
  end

  def add_wagon(wagon)
    if speed != 0
      puts "Stop train!!! Train is going at a speed #{speed} kph."
    elsif type != wagon.type
      puts "Type of wagon #{wagon.type} and train #{type} do not match."
    else
      wagons << wagon
    end
  end

  def del_wagon(wagon)
    if speed != 0
      puts "Stop train!!! Train is going at a speed #{speed} kph."
    elsif !wagons.empty?
      wagons.delete(wagon)
    end
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

  def current_station
    route.stations[@current_station_index]
  end

  def next_station
    route.stations[@current_station_index + 1]
  end

  def previous_station
    route.stations[@current_station_index - 1]
  end

  protected

  def validate!
    raise "Number can't be nil" if number.nil?
    raise 'Number has invalid format' if number !~ NUMBER_FORMAT
    raise "Type can't be nil" if type.nil?
    raise 'Type has invalid format' if type !~ TYPE_FORMAT
  end

  attr_writer :speed

  attr_writer :wagons
end
