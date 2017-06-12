# <Route> class.
# This class is used to manage the route.

class Route
  attr_accessor :stations_in_rout
  attr_reader :start_station, :end_station

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations_in_rout = [start_station, end_station]
  end

  def add_intermediate_station(intermediate_station)
    self.stations_in_rout << self.stations_in_rout[-1]
    self.stations_in_rout[-2] = intermediate_station
  end

  def del_intermediate_station(station_name)
    self.stations_in_rout.delete(station_name) { "There is no such station in route." }
  end

  def get_stations_in_route
    puts "Stations in route:"
    self.stations_in_rout.each { |station_in_rout|
      puts "\t#{station_in_rout.name}"
    }
  end
end
