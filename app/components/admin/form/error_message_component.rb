# frozen_string_literal: true

class Admin::Form::ErrorMessageComponent < ViewComponent::Form::ErrorMessageComponent
  def html_class
    'invalid-feedback mt-2 text-sm text-red-600'
  end

  # def messages
  #   # safe_join(method_errors, tag.br)
  #   method_errors.collect(&:underscore).to_sentence.capitalize
  # end
end
