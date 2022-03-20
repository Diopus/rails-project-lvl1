# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, options = {}, &_block)
      fields = options.map { |k, v| " #{k}=\"#{v}\"" }.join
      content = "#{yield}</#{name}>" if block_given?
      "<#{name}#{fields}>#{content}"
    end
  end
end
