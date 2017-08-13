require_relative 'manufacturer'

class Train
  include Manufacturer

  attr_reader :speed, :number, :type, :route, :wagons

  @@trains = []

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    @@trains << self
  end

  def self.find(number)
    search_train = nil
    @@trains.each do |train|
      search_train = train if train.number == number
    end
    return search_train
  end

  def speed_up
    self.speed += 10
    puts "Train picked up speed. Current speed = #{speed}"
  end

  def stop
    self.speed = 0
    puts "Train stopped. Current speed = #{speed}"
  end

  def route=(route)
    @route = route
    @current_station_index = 0
    route.stations.first.take_train(self)
    puts "Route of this train is from #{route.start_station.name} to #{route.end_station.name}"
  end

  def add_wagon(wagon)
    if speed != 0
      puts "Stop train!!! Train is going at a speed #{speed} kph."
    elsif type != wagon.type
      puts "Type of wagon #{wagon.type} and train #{type} do not match."
    else
      wagons << wagon
      puts "You attach wagon #{wagon.number} to train #{number}."
    end
  end

  def del_wagon(wagon)
    if speed != 0
      puts "Stop train!!! Train is going at a speed #{speed} kph."
    elsif wagons.size > 0
      wagons.delete(wagon)
      puts "You unhook wagon #{wagon.number} from train #{number}."
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

  def get_current_station
    station = route.stations[@current_station_index]
    puts "Current station is #{station.name}"
    return station
  end

  def get_next_station
    station = route.stations[@current_station_index + 1]
    puts "Next station is #{station.name}"
    return station
  end

  def get_previous_station
    station = route.stations[@current_station_index - 1]
    puts "Previous station is #{station.name}"
    return station
  end

  protected

  # Метод создан для удобства вызовы внутри класса.
  # Вызов вне класса не имеет смысла.
  # В дочерних классах метод может понадобиться для создания новых методов.
  def current_station
    self.route.stations[@current_station_index]
  end

  # У нас есть методы для работы со скростью.
  # Возможность изменять данный атрибут в обход данных методов
  # рушит логику работы программы.
  # В дочерних классах такая возможность может понадобиться.
  attr_writer :speed

  # У нас есть методы для добавления и удаления вагонов к поезду.
  # Возможнсть менять данный атрибут в обход данных метод
  # рушить логику работы программы.
  attr_writer :wagons
end
