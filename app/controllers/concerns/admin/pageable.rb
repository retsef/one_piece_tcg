module Admin
  module Pageable
    extend ActiveSupport::Concern

    included do
      include Pagy::Backend

      def paginate_resources(resources)
        # resources.page(params[:_page]).per(records_per_page)
        @paginate_info, resources = pagy(resources, page_param: per_page_param, items: records_per_page)
        resources
      end

      def records_per_page
        params[:items] || 10
      end

      def per_page_param
        :page
      end
    end
  end
end
