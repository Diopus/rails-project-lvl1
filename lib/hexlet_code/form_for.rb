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
      build_method_input(obj) unless obj.singleton_methods.include?(:input)
      build_method_submit(obj) unless obj.singleton_methods.include?(:submit)
      obj.fields = ['']
      form_fields = yield(obj)
    end

    form_fields << ''
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def self.build_method_input(obj)
    class << obj
      attr_accessor :fields

      def input(field, options = {})
        label = build_label(field, options)

        is_textarea = options[:as] == :text
        input = is_textarea ? build_textarea(field, options) : build_input(field, options)

        fields.push("  #{label}", "  #{input}") # temporary solution for tab
      end

      private

      def build_label(field, options)
        field_value = field.to_s.capitalize
        default_options = { for: field.to_s }
        given_options = options.except(:as)

        Tag.build('label', default_options.merge(given_options)) { field_value }
      end

      def build_input(field, options)
        field_value = public_send(field)
        default_options = { name: field, type: 'text', value: field_value }
        given_options = options.except(:as)

        Tag.build('input', default_options.merge(given_options))
      end

      def build_textarea(field, options)
        field_value = public_send(field)
        default_options = { cols: '20', rows: '40', name: field }
        given_options = options.except(:as)

        Tag.build('textarea', default_options.merge(given_options)) { field_value }
      end

      # def build_the_field(field_type, options, default_options, &_block)
      #   given_options = options.except(:as)
      #   updated_options = default_options.merge(given_options)
      #
      # Tag.build(field_type, updated_options) &_block
      # end
    end

    # obj.class.define_method :input do |field, options = {}|
    #
    # end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  def self.build_method_submit(obj)
    class << obj
      def submit(value = 'Save', options = {})
        default_options = { name: 'commit', type: 'submit', value: value }
        given_options = options.except(:as)
        new_tag = Tag.build('input', default_options.merge(given_options))

        fields.push("  #{new_tag}") # temporary solution for tab
      end
    end
  end
end
