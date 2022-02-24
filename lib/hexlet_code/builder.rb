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

      is_textarea = options[:as] == :text
      input = if is_textarea
                Textarea.build(field, @object.public_send(field), options)
              else
                Input.build(field, @object.public_send(field), options)
              end

      @fields.push(label, input)
    end

    def submit(value = 'Save', options = {})
      submit = Submit.build(value, options)

      @fields << submit
    end
  end
end
