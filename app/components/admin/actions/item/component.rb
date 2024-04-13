class Admin::Actions::Item::Component < ApplicationComponent
  attr_reader :url, :icon, :title, :variant_style, :options

  def initialize(url:, title: '', icon: nil, style: nil, **options)
    super

    @url = url
    @title = title
    @icon = icon
    @variant_style = style || { wrapper: :base, body: :normal, outer: :none }
    @options = options
  end

  style do
    base { %w[inline-flex items-center px-4 py-2 text-sm] }
    variants do
      wrapper do
        base { %w[w-full] }
        first do |body:, **|
          %w[relative bg-white text-gray-900 hover:bg-gray-50 focus:z-10 shadow-sm ring-1 ring-inset].tap do |it|
            it << 'ring-gray-300' if body == :normal
            it << 'ring-red-300' if body == :error
          end
        end
      end
      body do
        normal { %w[text-gray-700 hover:bg-gray-100 hover:text-gray-900] }
        error { %w[text-red-600 hover:bg-gray-100 hover:text-red-700] }
      end
      outer do
        none { %w[] }
        normal { %w[rounded-md] }
        left { %w[rounded-l-md] }
      end
    end

    defaults do
      { wrapper: :base, body: :normal, outer: :none }
    end
  end

  def html_class
    style(**variant_style)
  end

  def icon?
    icon.present?
  end
end
