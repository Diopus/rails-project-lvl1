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
      input = Input.build(field, @object.public_send(field), options)
      @fields.push(label, input)
    end

    def submit(value = 'Save', options = {})
      submit = Submit.build(value, options)

      @fields << submit
    end
  end
end
