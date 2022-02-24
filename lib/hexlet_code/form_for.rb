# frozen_string_literal: true

module HexletCode
  def self.form_for(obj, url: '#')
    form_fields = []
    builder = Builder.new(obj)
    form_fields = yield(builder) if block_given?

    Tag.build(
      'form',
      action: url,
      method: 'post'
    ) { form_fields.join }
  end
end
