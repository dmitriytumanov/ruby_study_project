class Station
  attr_reader :trains, :name

  NAME_FORMAT = /^[а-я]{5,}$/i

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def self.all
    @@stations
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def get_trains_at_station
    @trains
  end

  def get_trains_by_type(type)
    trains_by_type = []
    @trains.each do |train|
      if train.type == type
        trains_by_type << train
      end
    end
    trains_by_type
  end

  protected

  def validate!
    raise "Name can't be nil" if name.nil?
    raise "Name has invalid format" if name !~ NAME_FORMAT
    true
  end

  # Для работы с данным параметром созданы специальные методы.
  # Дублирование возможности менять значение данного параметра
  # рушит логику данной программы.
  # В дочерних классах изменение данного параметра может понадобиться.
  attr_writer :trains
end
