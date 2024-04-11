# frozen_string_literal: true

class Admin::Form::HintComponent < ViewComponent::Form::HintComponent
  self.tag = :small

  def html_class
    'mt-2 text-sm text-gray-500'
  end
end
