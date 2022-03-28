# frozen_string_literal: true

module HexletCode
  class Inputs
    class TextInput
      def self.build(field, field_value, options)
        given_options = options.except(:as)
        default_options = { cols: '20', rows: '40', name: field }
        Tag.build('textarea', default_options.merge(given_options)) { field_value }
      end
    end
  end
end
