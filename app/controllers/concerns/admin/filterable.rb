module Admin
  module Filterable
    extend ActiveSupport::Concern

    included do
      alias_method :scoped_resource_without_filter, :scoped_resource

      def scoped_resource
        resources = scoped_resource_without_filter
        @ransack_results = resources.ransack(params[:q])
        @ransack_results.result(distinct: true)
      end

      helper_method :show_filters?

      def filtered?(attribute = nil)
        return filter_count.positive? unless attribute

        params[:q].present? && params[:q][attribute].present?
      end

      def filter_value(attribute)
        return nil if params[:q].blank?

        params[:q][attribute]
      end

      def filter_count
        return 0 if params[:q].blank?

        params[:q].select { |_k, v| v.present? }.keys.size
      end

      helper_method :filtered?, :filter_value, :filter_count

      private

        def show_filters?
          dashboard.filterable_attributes.any?
        end
    end
  end
end
