module Administrate::Field
  class DatePreview < BasePreview
    def form
      field = Administrate::Field::Date.new(:attribute_name, ::Time.current, :form, resource:)
      render Administrate::Field::Date::Form::Component.new(field:, page: :form, form: form_obj)
    end

    def show
      field = Administrate::Field::Date.new(:attribute_name, ::Time.current, :show, resource:)
      render Administrate::Field::Date::Show::Component.new(field:, page: :show)
    end

    def index
      field = Administrate::Field::Date.new(:attribute_name, ::Time.current, :index, resource:)
      render Administrate::Field::Date::Index::Component.new(field:, page: :index)
    end

    private

      def resource
        SampleModel.new(attribute_name: ::Time.current)
      end

      def form_obj
        Admin::FormBuilder.new(
          'sample', resource, SampleTemplate.new(:attribute_name), {}
        )
      end
  end
end
