# frozen_string_literal: true

class Admin::Form::InlineSubmitComponent < ViewComponent::Form::SubmitComponent
  def html_class
    'inline-flex items-center text-sm font-medium cursor-pointer text-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500'
  end
end
