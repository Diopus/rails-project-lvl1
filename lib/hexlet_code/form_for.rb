# frozen_string_literal: true

# comment
module HexletCode
  # TEXTAREA_DEFAULT_OPTIONS = { cols: "20", rows: "40", name: field }.freeze

  def self.form_for(obj, url: '#', &block)
    form_fields = build_form_fields(obj, &block)

    Tag.build(
      'form',
      action: url,
      method: 'post'
    ) { form_fields.join("\n") }
  end

  def self.build_form_fields(obj, &_block)
    form_fields = ['']

    if block_given?
      obj.extend(Builder)
      obj.fields = ['']
      form_fields = yield(obj)
    end

    form_fields << ''
  end
end
