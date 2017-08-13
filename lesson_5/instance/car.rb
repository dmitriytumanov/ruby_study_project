require_relative 'instance_counter'

class Car
  include InstanceCounter

  def initialize(model)
    @model = model
    register_instance
  end
end
