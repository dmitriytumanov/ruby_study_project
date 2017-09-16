require_relative 'validation'

class Route
  include Validation

  validate :start_station, :presence
  validate :start_station, :type, Station

  validate :end_station, :presence
  validate :end_station, :type, Station

  attr_reader :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    validate!
    @stations = [start_station, end_station]
  end

  def add_intermediate_station(intermediate_station)
    stations.insert(-2, intermediate_station)
  end

  def del_intermediate_station(station_name)
    stations.delete(station_name) { 'There is no such station in route.' }
  end

  def stations_in_route
    @stations
  end

  protected

  attr_writer :stations
end
