# <Management of railway stations> program.
# This program allows you to manage stations, receive and send trains, display information about them, etc.

require_relative 'train'
require_relative 'route'
require_relative 'station'

my_train = Train.new("№_123_456", "passenger", 7)

nn_station = Station.new("NN")
kv_station = Station.new("Kovrov")
vl_station = Station.new("Vladimir")
mw_station = Station.new("Moscow")

my_route = Route.new(nn_station, mw_station)
my_route.add_intermediate_station(kv_station)
my_route.add_intermediate_station(vl_station)

my_train.route = my_route

my_train.move_next_station
my_train.get_previous_station
my_train.get_current_station
my_train.get_next_station
