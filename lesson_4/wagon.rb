class Wagon
  attr_reader :number, :type

  private

  # Запрещаю инициализацию через данный класс.
  # Создавать новые объекты нужно уметь только через
  # классы вагонов с определённым типом.
  # Проверял и так не получается. Вопрос как такого добиться ???
  def initialize(number, type)
    @number = number
    @type = type
  end
end
