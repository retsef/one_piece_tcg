module Admin
  module Exportable
    extend ActiveSupport::Concern

    included do
      def export
        search_term = params[:search].to_s.strip
        resources = Administrate::Search.new(scoped_resource,
                                             dashboard,
                                             search_term).run
        resources = apply_collection_includes(resources)
        resources = order.apply(resources)

        csv_data = Admin::ExporterService.csv(dashboard, resource_class, resources)

        respond_to do |format|
          format.csv { send_data csv_data, filename: "#{resource_name.to_s.pluralize}-#{Time.zone.today}.csv" }
        end
      end
    end
  end
end
