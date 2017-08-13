class Station
  attr_reader :trains, :name

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def self.all
    puts "Stations list:"
    @@stations.each do |station|
      puts station.name
    end
  end

  def take_train(train)
    trains << train
    puts "Train #{train.number} added to station #{name}"
  end

  def send_train(train)
    trains.delete(train)
    puts "Train #{train.number} removed from station #{name}"
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

  protected

  # Для работы с данным параметром созданы специальные методы.
  # Дублирование возможности менять значение данного параметра
  # рушит логику данной программы.
  # В дочерних классах изменение данного параметра может понадобиться.
  attr_writer :trains
end
