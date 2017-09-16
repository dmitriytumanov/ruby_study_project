module Accessors
  private

  def strong_attr_acessor(name, klass)
    define_method(name.to_sym) { instance_variable_get("@#{name}".to_sym) }
    define_method("#{name}=".to_sym) do |value|
      raise "Wrong type of variable" unless value.is_a?(klass)
      instance_variable_set("@#{name}".to_sym, value)
    end
  end

  def attr_accessor_with_history(*names)
    names.each do |name|
      define_method(name.to_sym) { instance_variable_get("@#{name}".to_sym) }
      define_method("#{name}=".to_sym) do |value|
        history = instance_variable_get("@#{name}_history".to_sym)
        history ||= []
        history << value
        instance_variable_set("@#{name}_history".to_sym, history)
        instance_variable_set("@#{name}".to_sym, value)
      end
      define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_history".to_sym) }
    end
  end
end
