# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.

class Admin::BaseController < Administrate::ApplicationController
  etag { Rails.application.importmap.digest(resolver: helpers) if request.format&.html? }
  layout 'admin'

  include Admin::Namespaced
  include Admin::Resourced
  include Admin::Authorizable
  # include Admin::Authenticated

  include Admin::FeatureSet

  include Admin::Searchable
  include Admin::Filterable
  include Admin::Pageable
  include Admin::DefaultOrder

  include Request::Locale
  include Request::Variant

  default_namespace :admin
  default_form_builder Admin::FormBuilder

  helper_method :turbo_frame_request?

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 15.
  def records_per_page
    per_page ||= params[:per_page]
    per_page ||= 6 if request_electron?
    per_page || 8
  end

  helper_method :records_per_page
  helper_method :dashboard

  # Copied from https://github.com/thoughtbot/administrate/blob/v0.17.0/app/controllers/administrate/application_controller.rb#L5
  def index
    authorize_resource(resource_class)
    search_term = params[:search].to_s.strip
    resources = filter_resources(scoped_resource, search_term:)
    resources = apply_collection_includes(resources)
    resources = apply_scopes(resources)
    resources = order.apply(resources)
    resources = paginate_resources(resources)
    page = Administrate::Page::Collection.new(dashboard, order:)

    render locals: {
      resources: resources,
      search_term: search_term,
      page: page
    }
  end

  def show
    # return unless stale? requested_resource

    render locals: {
      page: Administrate::Page::Show.new(dashboard, requested_resource)
    }
  end

  def create
    resource = resource_class.new(resource_params)
    authorize_resource(resource)

    if resource.save
      respond_to do |format|
        format.html do
          redirect_to(
            after_resource_created_path(resource),
            notice: translate_with_resource('create.success'),
            status: :see_other
          )
        end
        # format.turbo_stream
        # format.json
      end
    else
      render :new, locals: {
        page: Administrate::Page::Form.new(dashboard, resource)
      }, status: :unprocessable_entity
    end
  end

  def update
    authorize_resource(requested_resource)

    if requested_resource.update(resource_params)
      respond_to do |format|
        format.html do
          redirect_to(
            after_resource_updated_path(requested_resource),
            notice: translate_with_resource('update.success'),
            status: :see_other
          )
        end
        # format.turbo_stream do
        #   render locals: {
        #     page: Administrate::Page::Show.new(dashboard, requested_resource)
        #   }, status: :ok
        # end
        # format.json
      end
    else
      render :edit, locals: {
        page: Administrate::Page::Form.new(dashboard, requested_resource)
      }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_resource(requested_resource)

    if requested_resource.destroy
      respond_to do |format|
        format.html do
          redirect_to(
            after_resource_destroyed_path(requested_resource),
            notice: translate_with_resource('destroy.success'),
            status: :see_other
          )
        end
        # format.turbo_stream
        # format.json
      end
    else
      flash[:error] = requested_resource.errors.full_messages.join('<br/>')
      respond_to do |format|
        format.html do
          redirect_to after_resource_updated_path(requested_resource), status: :see_other
        end
        # format.turbo_stream
        # format.json
      end
    end
  end

  private

    delegate :resource_title, to: :resource_resolver
    helper_method :resource_title

    def resource_sti?
      resource_class.column_names.include? resource_class.inheritance_column
    end

    def resource_cloner
      "#{resource_class}Cloner".constantize
    end

    def descendants_dashboards
      resource_class.descendants.map(&:dashboard_class)
    end

    def read_param_value(data)
      case data
      when ActionController::Parameters
        return data.transform_values { |v| read_param_value(v) } unless data[:type]
        raise "Unrecognised param data: #{data.inspect}" if data[:type] != Administrate::Field::Polymorphic.to_s

        GlobalID::Locator.locate(data[:value])
      when String
        return nil if data.blank?
        return data.to_i if data.match?(/\A\d+\z/)
        return data.to_f if data.match?(/\A\d+\.\d+\z/)

        data
      else
        data
      end
    end

    def translate_with_resource(key)
      t(
        "admin.notification.#{key}",
        resource: resource_title
      )
    end

    def current_features
      Rails.features.for(store: current_store, user: current_user)
    end
end
