class Route
  attr_reader :start_station, :end_station, :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
  end

  def add_intermediate_station(intermediate_station)
    self.stations.insert(-2, intermediate_station)
  end

  def del_intermediate_station(station_name)
    self.stations.delete(station_name) { "There is no such station in route." }
  end

  def get_stations_in_route
    puts "Stations in route:"
    self.stations.each do |station|
      puts "\t#{station.name}"
    end
  end

  protected

  # Для работы с данным параметром не из класса
  # созданы специальные методы.
  # В дочерниз классах изменение данного параметра может понадобиться.
  attr_writer :stations
end
