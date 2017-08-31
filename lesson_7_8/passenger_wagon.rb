require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :seats_number, :free_seats_number

  def initialize(number, seats_number)
    super(number, 'Passenger')
    @seats_number = seats_number
    @free_seats_number = seats_number
  end

  def take_place
    @free_seats_number -= 1 if @free_seats_number > 0
  end

  def busy_seats
    @seats_number - @free_seats_number
  end

  def to_s
    [@number, @type, @free_seats_number, busy_seats].join(' ')
  end
end
