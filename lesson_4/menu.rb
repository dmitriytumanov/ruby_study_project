require_relative 'actions'

class Menu < Actions
  def initialize
    super
  end

  def add_here
    loop do
      open_menu
      handle_action
      puts "Вы хотите продолжить работу с программой? (y/n)"
      input = gets.chomp
      break if input == "n"
    end
  end

  def open_menu
    puts "Выберите действие из списка:
    1.  Создать станцию.
    2.  Создать поезд.
    3.  Создать маршрут.
    4.  Добавить станцию в маршрут.
    5.  Удалить станцию из маршрута.
    6.  Назначить маршрут поезду.
    7.  Создать вагон.
    8.  Добавить вагон к поезду.
    9.  Отцепить вагон от поезда.
    10. Переместить поезд по маршруту вперёд.
    11. Переместить поезд по маршруту назад.
    12. Просматреть список станций.
    13. Просматреть список поездов на станции."
  end

  def handle_action
    case action_number = gets.chomp.to_i
    when 1
      create_station
    when 2
      create_train
    when 3
      create_route
    when 4
      add_station_to_route
    when 5
      del_station_from_route
    when 6
      schedule_route_to_train
    when 7
      create_wagon
    when 8
      add_wagon_to_train
    when 9
      del_wagon_from_train
    when 10
      move_train_next
    when 11
      move_train_previous
    when 12
      get_stations_list
    when 13
      get_train_at_station
    end
  end
end
