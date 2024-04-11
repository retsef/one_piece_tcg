# frozen_string_literal: true

class Admin::Form::CheckBoxComponent < ViewComponent::Form::CheckBoxComponent
  self.tag_klass = ActionView::Helpers::Tags::CheckBox

  include ViewComponentContrib::StyleVariants

  style do
    base { %w[h-4 w-4 rounded] }
    variants do
      field do
        normal { %w[border-gray-300 text-primary-600 focus:ring-primary-500] }
        error { %w[border-red-300 text-red-900 focus:outline-none focus:ring-red-500] }
      end
    end
  end

  def html_class
    style(field: method_errors? ? :error : :normal)
  end
end
