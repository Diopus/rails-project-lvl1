# frozen_string_literal: true

module HexletCode
  class Builder
    # attr_accessor :fields
    def initialize(object)
      @object = object
      @fields = []
    end

    def input(field, options = {})
      label = Label.build(field, options)

      input_type = options.fetch(:as, '').capitalize
      input_class_name = "HexletCode::Inputs::#{input_type}Input"
      input_class = input_class_name.constantize
      input = input_class.build(field, @object.public_send(field), options)

      @fields.push(label, input)
    end

    def submit(value = 'Save', options = {})
      submit = Submit.build(value, options)

      @fields << submit
    end
  end
end
