# frozen_string_literal: true

class Admin::Form::HoneypotComponent < ViewComponent::Form::TextFieldComponent
  delegate :honeypot_fields, :honeypot_string, to: :helpers

  def method_name
    honeypot_fields.keys.first || :unuseful_field
  end

  def html_class
    'hidden'
  end
end
