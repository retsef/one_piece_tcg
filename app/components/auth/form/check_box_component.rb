# frozen_string_literal: true

class Auth::Form::CheckBoxComponent < ViewComponent::Form::CheckBoxComponent
  self.tag_klass = ActionView::Helpers::Tags::CheckBox

  def html_class
    'h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500'
  end
end
