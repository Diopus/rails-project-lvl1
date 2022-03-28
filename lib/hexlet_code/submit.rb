# frozen_string_literal: true

# comment
module HexletCode
  # comment
  class Submit
    def self.build(value, options)
      default_options = { name: 'commit', type: 'submit', value: value }
      given_options = options.except(:as)

      Tag.build('input', default_options.merge(given_options))
    end
  end
end
