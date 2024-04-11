# frozen_string_literal: true

class Admin::Form::SubmitComponent < ViewComponent::Form::SubmitComponent
  include ViewComponentContrib::StyleVariants

  def html_class
    'inline-flex justify-center py-2 px-4 border border-transparent shadow-sm
      text-sm font-medium rounded-md text-white bg-primary-600 hover:bg-primary-700
      focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500'
  end
end
