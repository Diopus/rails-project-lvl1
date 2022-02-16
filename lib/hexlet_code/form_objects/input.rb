# frozen_string_literal: true

# comment
module HexletCode
  # comment
  class Input
    def self.build(field, field_value, options)
      default_options = { name: field, type: 'text', value: field_value }
      given_options = options.except(:as)

      Tag.build('input', default_options.merge(given_options))
    end
  end
end
