# <Management of railway stations> program.
# This program allows you to manage stations, receive and send trains, display information about them, etc.

require_relative 'train'
require_relative 'route'
require_relative 'station'

my_train = Train.new("1_my_train_1", "passenger", 4)

nn_station = Station.new("NN")
kv_station = Station.new("Kovrov")
vl_station = Station.new("Vladimir")
mw_station = Station.new("Moscow")

my_route = Route.new(nn_station, mw_station)
my_route.add_intermediate_station(kv_station)
my_route.add_intermediate_station(vl_station)
my_route.get_stations_in_route

my_train.add_wagon
my_train.del_wagon
