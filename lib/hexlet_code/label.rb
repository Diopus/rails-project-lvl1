# frozen_string_literal: true

# comment
module HexletCode
  # comment
  class Label
    def self.build(field, options)
      field_value = field.to_s.capitalize
      default_options = { for: field.to_s }
      given_options = options.except(:as)

      Tag.build('label', default_options.merge(given_options)) { field_value }
    end
  end
end
