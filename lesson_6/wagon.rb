require_relative 'manufacturer'

class Wagon
  include Manufacturer

  attr_reader :number, :type

  NUMBER_FORMAT = /^[а-я]{3}\d{3}-?[а-я]{2}\d{2}$/i

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Number can't be nil" if number.nil?
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
    raise "Type can't be nil" if type.nil?
    raise "Type has invalid format" if type !~ TYPE_FORMAT
    true
  end
end
