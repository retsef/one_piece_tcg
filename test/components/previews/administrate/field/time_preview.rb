module Administrate::Field
  class TimePreview < BasePreview
    def form
      field = Administrate::Field::Boolean.new(:attribute_name, ::Time.current, :form, resource:)
      render Administrate::Field::Boolean::Form::Component.new(field:, page: :form, form: form_obj)
    end

    def show
      field = Administrate::Field::Boolean.new(:attribute_name, ::Time.current, :show, resource:)
      render Administrate::Field::Boolean::Show::Component.new(field:, page: :show)
    end

    def index
      field = Administrate::Field::Boolean.new(:attribute_name, ::Time.current, :index, resource:)
      render Administrate::Field::Boolean::Index::Component.new(field:, page: :index)
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
