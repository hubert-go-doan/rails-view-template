# frozen_string_literal: true

module UiFormHelpers
  def ui_text_field(field_name, attributes = {}, &)
    label = options.delete(:label) { field_name.to_s.humanize }
    type = options.delete(:type) { :text }

    @template.render Inputs::Text::Component.new(
      field_name,
      form_builder: self, type:, label:, **attributes,
      &
    )
  end

  def ui_email_field(field_name, attributes = {}, &)
    label = options.delete(:label) { field_name.to_s.humanize }
    type = options.delete(:type) { :email }
    @template.render Inputs::Text::Component.new(
      field_name,
      form_builder: self, type:, label:, autocomplete: 'email', **attributes,
      &
    )
  end

  def ui_password_field(field_name, attributes = {}, &)
    label = options.delete(:label) { field_name.to_s.humanize }
    type = options.delete(:type) { :password }
    @template.render(
      Inputs::Text::Component.new(field_name, form_builder: self, label:, type:, **attributes), &
    )
  end

  def ui_text_area(field_name, attributes = {}, &)
    label = options.delete(:label) { field_name.to_s.humanize }
    @template.render(Inputs::Textarea::Component.new(field_name, form_builder: self, label:, **attributes), &)
  end

  def ui_submit(value = nil, attributes = {})
    value ||= submit_default_value
    options.delete(:type)
    @template.render Button::Component.new(value, kind: :primary, type: :submit, **attributes)
  end
end
