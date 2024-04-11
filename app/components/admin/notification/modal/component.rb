module Admin::Notification
  class Modal::Component < BaseComponent
    style :close do
      variants do
        color do
          MODAL_COLOR { 'focus:ring-MODAL_COLOR-500' }
          slate { 'focus:ring-slate-500' }
          red { 'focus:ring-red-500' }
          pink { 'focus:ring-pink-500' }
          blue { 'focus:ring-blue-500' }
          green { 'focus:ring-green-500' }
          yellow { 'focus:ring-yellow-500' }
          orange { 'focus:ring-orange-500' }
          purple { 'focus:ring-purple-500' }
          indigo { 'focus:ring-indigo-500' }
          gray { 'focus:ring-gray-500' }
        end
      end
    end

    style :icon do
      variants do
        background do
          MODAL_COLOR { 'bg-MODAL_COLOR-100' }
          slate { 'bg-slate-100' }
          red { 'bg-red-100' }
          pink { 'bg-pink-100' }
          blue { 'bg-blue-100' }
          green { 'bg-green-100' }
          yellow { 'bg-yellow-100' }
          orange { 'bg-orange-100' }
          purple { 'bg-purple-100' }
          indigo { 'bg-indigo-100' }
          gray { 'bg-gray-100' }
        end
        color do
          MODAL_COLOR { 'text-MODAL_COLOR-600' }
          slate { 'text-slate-600' }
          red { 'text-red-600' }
          pink { 'text-pink-600' }
          blue { 'text-blue-600' }
          green { 'text-green-600' }
          yellow { 'text-yellow-600' }
          orange { 'text-orange-600' }
          purple { 'text-purple-600' }
          indigo { 'text-indigo-600' }
          gray { 'text-gray-600' }
        end
      end
    end

    style :commit do
      variants do
        color do
          MODAL_COLOR { %w[hover:bg-MODAL_COLOR-700 focus:ring-MODAL_COLOR-500 bg-MODAL_COLOR-600] }
          slate { %w[hover:bg-slate-700 focus:ring-slate-500 bg-slate-600] }
          red { %w[hover:bg-red-700 focus:ring-red-500 bg-red-600] }
          pink { %w[hover:bg-pink-700 focus:ring-pink-500 bg-pink-600] }
          blue { %w[hover:bg-blue-700 focus:ring-blue-500 bg-blue-600] }
          green { %w[hover:bg-green-700 focus:ring-green-500 bg-green-600] }
          yellow { %w[hover:bg-yellow-700 focus:ring-yellow-500 bg-yellow-600] }
          orange { %w[hover:bg-orange-700 focus:ring-orange-500 bg-orange-600] }
          purple { %w[hover:bg-purple-700 focus:ring-purple-500 bg-purple-600] }
          indigo { %w[hover:bg-indigo-700 focus:ring-indigo-500 bg-indigo-600] }
          gray { %w[hover:bg-gray-700 focus:ring-gray-500 bg-gray-600] }
        end
      end
    end

    style :cancel do
      variants do
        color do
          MODAL_COLOR { 'focus:ring-MODAL_COLOR-500' }
          slate { 'focus:ring-slate-500' }
          red { 'focus:ring-red-500' }
          pink { 'focus:ring-pink-500' }
          blue { 'focus:ring-blue-500' }
          green { 'focus:ring-green-500' }
          yellow { 'focus:ring-yellow-500' }
          orange { 'focus:ring-orange-500' }
          purple { 'focus:ring-purple-500' }
          indigo { 'focus:ring-indigo-500' }
          gray { 'focus:ring-gray-500' }
        end
      end
    end

    attr_reader :modal_id, :color, :title, :body, :commit, :cancel

    COLORS = %w[slate red pink blue pink green yellow orange purple indigo].freeze

    def initialize(modal_id:, title:, body:, color:, commit:, cancel:)
      super

      @modal_id = modal_id
      @title = title
      @body = body
      @color = color.to_sym
      @commit = commit
      @cancel = cancel
    end

    def icon
      'heroicons/24/outline/exclamation-circle.svg'
    end
  end
end
