class Route
  attr_reader :start_station, :end_station, :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def add_intermediate_station(intermediate_station)
    self.stations.insert(-2, intermediate_station)
  end

  def del_intermediate_station(station_name)
    self.stations.delete(station_name) { "There is no such station in route." }
  end

  def get_stations_in_route
    @stations
  end

  protected

  def validate!
    raise "Start station can't be nil" if start_station.nil?
    raise "End station can't be nil" if end_station.nil?
    true
  end

  # Для работы с данным параметром не из класса
  # созданы специальные методы.
  # В дочерниз классах изменение данного параметра может понадобиться.
  attr_writer :stations
end
