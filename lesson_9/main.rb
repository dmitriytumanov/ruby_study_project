require_relative 'menu'
require_relative 'wagon'
require_relative 'station'
require_relative 'route'
require_relative 'train'

# menu = Menu.new
# menu.add_here

start_station = Station.new("Москва")
end_station = Station.new("Самара")
route = Route.new(start_station,end_station)
train = Train.new("абв123гд45","Cargo")
wagon = Wagon.new("абв123гд45","Cargo")
