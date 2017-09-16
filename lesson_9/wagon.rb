require_relative 'manufacturer'
require_relative 'validation'

class Wagon
  include Manufacturer
  include Validation

  NUMBER_FORMAT = /^[а-я]{3}\d{3}-?[а-я]{2}\d{2}$/i
  TYPE_FORMAT = /Cargo|Passenger/

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :number, :type, String

  validate :type, :presence
  validate :type, :format, TYPE_FORMAT
  validate :type, :type, String

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end
end
