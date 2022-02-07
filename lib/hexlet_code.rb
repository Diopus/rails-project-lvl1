# frozen_string_literal: true

require "active_support/inflector"
require_relative "hexlet_code/form_for"
require_relative "hexlet_code/version"
# comment
module HexletCode
  autoload(:Tag, "./lib/hexlet_code/tag.rb")

  class Error < StandardError; end
  # Your code goes here...
end
