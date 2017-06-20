require_relative 'station'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class Actions
  def initialize
    @stations_list = []
    @trains_list = []
    @routes_list = []
    @wagons_list = []
  end

  def create_station
    puts "Введите название станции:"
    name = gets.chomp
    station = сheck_station_availability(name)
  end

  def create_train
    puts "Введите номер поезда:"
    number = gets.chomp.to_i
    puts "Введите тип поезда (passenger/cargo):"
    type = gets.chomp
    train = check_train_availability(number, type)
  end

  def сheck_station_availability(name)
    search_station = nil
    @stations_list.each do |station|
      if station.name == name
        search_station = station
        puts "Станция #{search_station.name} уже существует."
        break
      end
    end
    if search_station == nil
      search_station = Station.new(name)
      @stations_list << search_station
      puts "Вы создали станцию #{search_station.name}"
    end
    return search_station
  end

  def check_train_availability(number, type)
    search_train = nil
    @trains_list.each do |train|
      if number == number
        search_train = train
        puts "Поезд #{search_train.number} уже существует."
        break
      end
    end
    if search_train == nil
      search_train = PassengerTrain.new(number) if type == "passenger"
      search_train = CargoTrain.new(number) if type == "cargo"
      @trains_list << search_train
      puts "Вы создали поезд типа #{search_train.type} c номером #{search_train.number}"
    end
    return search_train
  end

  def check_route_availability(start_station_name, end_station_name)
    search_route = nil
    @routes_list.each do |route|
      if route.start_station == start_station_name && route.end_station == end_station_name
        search_route = route
        puts "Маршрут из #{search_route.start_station} в #{search_route.end_station} уже существует."
        break
      end
    end
    if search_route == nil
      search_route = Route.new(start_station_name, end_station_name)
      @routes_list << search_route
      puts "Вы создали маршрут из #{search_route.start_station} в #{search_route.end_station}"
    end
    return search_route
  end

  def check_wagon_availability(number, type)
    search_wagon = nil
    @wagons_list.each do |wagon|
      if number == number
        search_wagon = wagon
        puts "Вагон #{wagon.number} уже существует."
        break
      end
    end
    if search_wagon == nil
      search_wagon = PassengerWagon.new(number) if type == "passenger"
      search_wagon = CargoWagon.new(number) if type == "cargo"
      @wagons_list << search_wagon
      puts "Вы создали вагон типа #{search_wagon.type} c номером #{search_wagon.number}"
    end
    return search_wagon
  end

  def create_route
    puts "Введите название начальной станции маршрута:"
    start_station_name = gets.chomp
    puts "Введите название конечной станции маршрута:"
    end_station_name = gets.chomp
    route = check_route_availability(start_station_name, end_station_name)
  end

  def add_station_to_route
    puts "Введите название станции для добавления:"
    station_name = gets.chomp
    puts "Введите название начальной станции маршрута:"
    start_station_name = gets.chomp
    puts "Введите название конечной станции маршрута:"
    end_station_name = gets.chomp
    station = сheck_station_availability(station_name)
    start_station = сheck_station_availability(start_station_name)
    end_station = сheck_station_availability(end_station_name)
    route = check_route_availability(start_station.name, end_station.name)
    route.add_intermediate_station(station)
    puts "Вы добавили станцию #{station.name} в маршрут из #{route.start_station} в #{route.end_station}"
  end

  def del_station_from_route
    puts "Введите название станции для удаление:"
    station_name = gets.chomp
    puts "Введите название начальной станции маршрута:"
    start_station_name = gets.chomp
    puts "Введите название конечной станции маршрута:"
    end_station_name = gets.chomp
    station = сheck_station_availability(station_name)
    start_station = сheck_station_availability(start_station_name)
    end_station = сheck_station_availability(end_station_name)
    route = check_route_availability(start_station.name, end_station.name)
    route.del_intermediate_station(station)
    puts "Вы удалили станцию #{station.name} в маршруте из #{route.start_station} в #{route.end_station}."
  end

  def schedule_route_to_train
    puts "Введите номер поезда:"
    number = gets.chomp.to_i
    puts "Введите тип поезда (passenger/cargo):"
    type = gets.chomp
    puts "Введите название начальной станции маршрута:"
    start_station_name = gets.chomp
    puts "Введите название конечной станции маршрута:"
    end_station_name = gets.chomp
    train = check_train_availability(number, type)
    start_station = сheck_station_availability(start_station_name)
    end_station = сheck_station_availability(end_station_name)
    route = check_route_availability(start_station.name, end_station.name)
    # TODO: Почему здесь происходит баг?
    # train.rb:49:in `route=': undefined method `take_train' for "my_name":String (NoMethodError)
    train.route = route
    puts "Вы назначили поезду #{train.number} марщрут из #{route.start_station} в #{route.end_station}"
  end

  def create_wagon
    puts "Введите номер вагона:"
    number = gets.chomp.to_i
    puts "Введите тип вагона (passenger/cargo):"
    type = gets.chomp
    wagon = check_wagon_availability(number, type)
  end

  def add_wagon_to_train
    train = create_train
    wagon = create_wagon
    train.add_wagon(wagon)
  end

  def del_wagon_from_train
    train = create_train
    wagon = create_wagon
    train.del_wagon(wagon)
  end

  def move_train_next
    puts "Введите номер поезда:"
    number = gets.chomp.to_i
    puts "Введите тип поезда (passenger/cargo):"
    type = gets.chomp
    train = check_train_availability(number, type)
    train.move_next_station
    puts "Вы переместили поезд с номером #{train.number} на следующую станцию."
  end

  def move_train_previous
    puts "Введите номер поезда:"
    number = gets.chomp.to_i
    puts "Введите тип поезда (passenger/cargo):"
    type = gets.chomp
    train = check_train_availability(number, type)
    train.move_previous_station
    puts "Вы переместили поезд с номером #{train.number} на предыдущую станцию."
  end

  def get_stations_list
    if @stations_list.size == 0
      puts "Ещё не создали ни одной станции."
    else
      puts "Список станций:"
      @stations_list.each do |station|
        puts "Название - #{station.name}"
      end
    end
  end

  def get_train_at_station
    puts "Введите название станции:"
    name = gets.chomp
    station = сheck_station_availability(name)
    station.trains.each do |train|
      puts "Номер поезда - #{train.number}"
    end
  end
end
