# frozen_string_literal: true

module HexletCode
  class Inputs
    class Input
      def self.build(field, field_value, options)
        given_options = options.except(:as)
        default_options = { name: field, type: 'text', value: field_value }
        Tag.build('input', default_options.merge(given_options))
      end
    end
  end
end
