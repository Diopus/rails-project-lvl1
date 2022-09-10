# frozen_string_literal: true

module HexletCode
  SINGLE_TAGS = %w[br img input].freeze

  class Tag
    def self.build(name, options = {})
      fields = options.map { |k, v| " #{k}=\"#{v}\"" }.join
      return "<#{name}#{fields}>" if SINGLE_TAGS.include?(name)

      content = block_given? ? yield : ''
      "<#{name}#{fields}>#{content}</#{name}>"
    end
  end
end
