# frozen_string_literal: true

require 'active_support/inflector'
require_relative 'hexlet_code/form_for'
require_relative 'hexlet_code/version'

# autoloading tools
module HexletCode
  autoload(:Builder, ['hexlet_code/', 'builder.rb'].join)
  autoload(:Tag, ['hexlet_code/', 'tag.rb'].join)

  autoload(:Label, ['hexlet_code/', 'label.rb'].join)
  autoload(:Inputs, ['hexlet_code/', 'inputs.rb'].join)
  autoload(:Submit, ['hexlet_code/', 'submit.rb'].join)

  class Error < StandardError; end
end
