module Validation
  def self.included(receiver)
    receiver.extend ClassMethods
  end

  class ObjectNotValid < StandardError ;end

  module ClassMethods
    def validate(attribute, validation_type, *params)
      @validations ||= []
      @validations << { attribute: attribute, validation_type: validation_type, params: params }
    end
  end

  def validate!
    validations = self.class.instance_variable_get('@validations')
    validations.each do |validation|
      attribute = instance_variable_get("@#{validation[:attribute]}")
      params = validation[:params]
      self.send(validation[:validation_type], attribute, *params)
    end
  end

  def valid?
    validate!
    true
  rescue ObjectNotValid
    false
  end

  private

  def presence(attribute)
    raise ObjectNotValid, 'Attribute is empty' if attribute.nil? || attribute == ""
  end

  def format(attribute, pattern)
    raise ObjectNotValid, 'Wrong attribute format' if attribute !~ pattern
  end

  def type(attribute, klass)
    raise ObjectNotValid, 'Wrong attribute class' unless attribute.is_a?(klass)
  end
end
