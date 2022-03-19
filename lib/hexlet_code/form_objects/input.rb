# frozen_string_literal: true

# comment
module HexletCode
  # comment
  class Input
    def self.build(field, field_value, options)
      given_options = options.except(:as)

      is_textarea = options[:as] == :text
      if is_textarea
        default_options = { cols: '20', rows: '40', name: field }
        Tag.build('textarea', default_options.merge(given_options)) { field_value }
      else
        default_options = { name: field, type: 'text', value: field_value }
        Tag.build('input', default_options.merge(given_options))
      end
    end
  end
end
