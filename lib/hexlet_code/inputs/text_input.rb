# frozen_string_literal: true

module HexletCode
  class Inputs
    class TextInput
      def self.build(field, field_value, options)
        given_options = options.except(:as)
        default_options = { cols: '20', rows: '40', name: field }

        { name: 'textarea',
          options: default_options.merge(given_options),
          block: field_value }
      end
    end
  end
end
