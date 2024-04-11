# frozen_string_literal: true

class Admin::Form::FileFieldComponent < ViewComponent::Form::FileFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::FileField

  include ViewComponentContrib::StyleVariants

  style do
    base { %w[block w-full sm:text-sm rounded-md cursor-pointer border p-1.5] }
    variants do
      field do
        normal { %w[border-gray-300 text-gray-900 focus:ring-primary-500 focus:border-primary-500] }
        error { %w[pr-10 border-red-300 text-red-900 placeholder-red-300 focus:outline-none focus:ring-red-500 focus:border-red-500] }
      end
    end
  end

  def html_class
    style(field: method_errors? ? :error : :normal)
  end
end
