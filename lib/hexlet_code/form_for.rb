# frozen_string_literal: true

module HexletCode
  def self.form_for(obj, url: '#')
    form_fields = []
    builder = Builder.new(obj)
    form_fields = yield(builder) if block_given?

    form_content = form_fields.map { |field| Tag.build(field[:name], field[:options]) {field[:block]} }
    Tag.build(
      'form',
      action: url,
      method: 'post'
    ) { form_content.join }
  end
end
