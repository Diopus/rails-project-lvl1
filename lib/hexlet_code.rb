# frozen_string_literal: true

require 'active_support/inflector'
require_relative 'hexlet_code/form_for'
require_relative 'hexlet_code/version'

# autoloading tools
module HexletCode
  autoload(:Builder, ['hexlet_code/', 'builder.rb'].join)
  autoload(:Tag, ['hexlet_code/', 'tag.rb'].join)

  autoload(:Label, ['hexlet_code/form_objects/', 'label.rb'].join)
  autoload(:Textarea, ['hexlet_code/form_objects/', 'textarea.rb'].join)
  autoload(:Input, ['hexlet_code/form_objects/', 'input.rb'].join)
  autoload(:Submit, ['hexlet_code/form_objects/', 'submit.rb'].join)

  class Error < StandardError; end
end
