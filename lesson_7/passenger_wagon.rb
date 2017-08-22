require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :seats_number, :free_seats_number, :busy_seats_number

  def initialize(number, seats_number)
    super(number, "Passenger")
    @seats_number = seats_number
    @free_seats_number = seats_number
    @busy_seats_number = 0
  end

  def take_place
    @free_seats_number -= 1
    @busy_seats_number += 1
  end
end
