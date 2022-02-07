# frozen_string_literal: true

# comment
module HexletCode
  def self.form_for(obj, url: "#", &block)
    form_fields = build_form_fields(obj, &block)

    Tag.build(
      "form",
      action: url,
      method: "post"
    ) { form_fields.join("\n") }
  end

  def self.build_form_fields(obj, &_block)
    form_fields = [""]

    if block_given?
      build_method_input(obj) unless obj.singleton_methods.include?(:input)
      build_method_submit(obj) unless obj.singleton_methods.include?(:submit)
      obj.fields = [""]
      form_fields = yield(obj)
    end

    form_fields << ""
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def self.build_method_input(obj)
    class << obj
      attr_accessor :fields

      def input(field, options = {})
        label = build_label(field)

        is_textarea = options[:as] == :text
        input = is_textarea ? build_textarea(field, options) : build_input(field)

        fields.push("  #{label}", "  #{input}") # temporary solution for tab
      end

      private

      def build_label(field)
        field_value = field.to_s.capitalize

        Tag.build(
          "label",
          for: field.to_s
        ) { field_value }
      end

      def build_input(field)
        field_value = public_send(field)

        Tag.build(
          "input",
          name: field,
          type: "text",
          value: field_value
        )
      end

      def build_textarea(field, options)
        field_value = public_send(field)

        Tag.build(
          "textarea",
          cols: options.fetch(:cols, "20"),
          rows: options.fetch(:rows, "40"),
          name: field
        ) { field_value }
      end
    end

    # obj.class.define_method :input do |field, options = {}|
    #
    # end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  def self.build_method_submit(obj)
    class << obj
      def submit(value = "Save")
        new_tag = Tag.build(
          "input",
          name: "commit",
          type: "submit",
          value: value
        )

        fields.push("  #{new_tag}") # temporary solution for tab
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
end
