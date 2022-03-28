# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, options = {}, &_block)
      fields = options.map { |k, v| " #{k}=\"#{v}\"" }.join
      return "<#{name}#{fields}>" if name == 'input'

      content = block_given? ? yield : ''
      "<#{name}#{fields}>#{content}</#{name}>"
    end
  end
end
