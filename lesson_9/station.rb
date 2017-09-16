require_relative 'validation'

class Station
  include Validation

  NAME_FORMAT = /^[а-я]{5,}$/i

  validate :name, :presence
  validate :name, :format, NAME_FORMAT
  validate :name, :type, String

  attr_reader :trains

  @@stations = []

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
  end

  def each_train
    @trains.each { |train| yield(train) }
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

  def trains_at_station
    @trains
  end

  def trains_by_type(type)
    trains_by_type = []
    @trains.each do |train|
      trains_by_type << train if train.type == type
    end
    trains_by_type
  end

  protected

  attr_writer :trains
end
