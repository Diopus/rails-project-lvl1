# frozen_string_literal: true

# comment
module HexletCode
  # comment
  class Tag
    def self.build(name, **kwargs, &_block)
      return "<>" if name.nil?

      kwargs.compact!
      kwargs.each_with_object(fields = []) { |(k, v), _| fields << " #{k}=\"#{v}\"" }

      array = ["<#{name}", fields, ">"]
      array << "#{yield}</#{name}>" if block_given?

      array.join
    end
  end
end
