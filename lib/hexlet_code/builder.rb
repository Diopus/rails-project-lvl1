# frozen_string_literal: true

# comment
module HexletCode
  # comment
  module Builder
    attr_accessor :fields

    def input(field, options = {})
      label = Label.build(field, options)

      is_textarea = options[:as] == :text
      input = if is_textarea
                Textarea.build(field, public_send(field), options)
              else
                Input.build(field, public_send(field), options)
              end

      fields.push("  #{label}", "  #{input}") # temporary solution for tab
    end

    def submit(value = 'Save', options = {})
      submit = Submit.build(value, options)

      fields.push("  #{submit}") # temporary solution for tab
    end
  end
end
