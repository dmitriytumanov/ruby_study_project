# <Management of railway stations> program.
# This program allows you to manage stations, receive and send trains, display information about them, etc.

require_relative 'train'
require_relative 'route'
require_relative 'station'

my_train_1 = Train.new("1_my_train_1", "freight", 4)
my_train_2 = Train.new("2_my_train_2", "passenger", 6)
my_train_3 = Train.new("3_my_train_3", "freight", 2)
my_train_4 = Train.new("4_my_train_4", "passenger", 7)

my_station = Station.new("London")
my_station.take_train(my_train_1)
my_station.take_train(my_train_2)
my_station.take_train(my_train_3)
my_station.take_train(my_train_4)

my_station.get_trains_at_station
my_station.trains_by_type("freight")
my_station.trains_by_type("passenger")
