# frozen_string_literal: true

# a
class Tag
  def self.build(name, **kwargs, &block)
    return "<>" if name.nil?

    array = ["<#{name}"]
    kwargs.each { |k, v| array << " #{k}=\"#{v}\"" }
    array << ">"

    array << "#{yield}</#{name}>" if block_given?

    array.join
  end
end
