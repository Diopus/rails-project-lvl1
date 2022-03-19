# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, options = {}, &_block)
      options.each_with_object(fields = []) { |(k, v), _| fields << " #{k}=\"#{v}\"" }

      tag = ["<#{name}", fields, '>']
      tag << "#{yield}</#{name}>" if block_given?

      tag.join
    end
  end
end
