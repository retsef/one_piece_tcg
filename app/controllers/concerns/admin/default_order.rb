module Admin::DefaultOrder
  extend ::ActiveSupport::Concern

  DIRECTIONS = %i[asc desc ASC DESC].freeze

  class_methods do
    def default_order(model = resource_class, options)
      param = (model.try(:name) || model).to_s.underscore.to_sym
      order = extract_sort_by_from_options(options)

      before_action(options.without(:_order, :_direction, :order)) do
        if !params[param] || !params[param][:order]
          params[param] ||= {}
          params[param].merge!(order)
        end
      end
    end

    private

      def extract_sort_by_from_options(options)
        return { order: options, direction: :asc } unless options.is_a?(::Hash)
        return { order: options[:order], direction: options[:direction] || :asc } if options[:order] && DIRECTIONS.exclude?(options[:order].to_sym)

        { order: options.keys.first, direction: options.values.first }
      end
  end

  included do
    private

      def sorting_params
        from_query = Hash.try_convert(request.query_parameters[resource_name]) || {}
        return from_query if from_query.present?

        params.fetch(resource_name) { ActionController::Parameters.new({}) }
              .permit(:direction, :order)
      end
  end
end
