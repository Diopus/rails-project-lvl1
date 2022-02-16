# frozen_string_literal: true

# comment
module HexletCode
  # comment
  class Textarea
    def self.build(field, field_value, options)
      default_options = { cols: '20', rows: '40', name: field }
      given_options = options.except(:as)

      Tag.build('textarea', default_options.merge(given_options)) { field_value }
    end
  end
end
