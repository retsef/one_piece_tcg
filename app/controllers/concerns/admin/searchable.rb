# frozen_string_literal: true

module Admin::Searchable
  extend ActiveSupport::Concern

  included do
    def filter_resources(resources, search_term:)
      shared_context = Ransack::Context.for(resource_class)

      conditions = dashboard.search_attributes.map do |attr|
        resource_class.ransack({ "#{attr}_cont" => search_term }, context: shared_context)
      end

      shared_conditions = conditions.filter_map do |search|
        Ransack::Visitor.new.accept(search.base)
      end

      resources.joins(shared_context.join_sources)
               .where(shared_conditions.reduce(&:or))
    end

    # ref => https://github.com/thoughtbot/administrate/blob/v0.15.0/app/helpers/administrate/application_helper.rb#L54-L60
    def sanitized_order_params(page, current_field_name)
      collection_names = page.item_associations + [ current_field_name ]
      association_params = collection_names.map do |assoc_name|
        { assoc_name => %i[order direction page per_page] }
      end
      params.permit(:search, :id, :page, :per_page, association_params, q: {})
    end

    helper_method :sanitized_order_params
    helper_method :show_search_bar?
  end
end
