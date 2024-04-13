module Administrate::Field
  class SelectPreview < BasePreview
    def form
      field = Administrate::Field::Select.new(:attribute_name, 'option1', :form, resource:, collection:)
      render Administrate::Field::Select::Form::Component.new(field:, page: :form, form: form_obj)
    end

    def show
      field = Administrate::Field::Select.new(:attribute_name, 'option1', :show, resource:, collection:)
      render Administrate::Field::Select::Show::Component.new(field:, page: :show)
    end

    def index
      field = Administrate::Field::Select.new(:attribute_name, 'option1', :index, resource:, collection:)
      render Administrate::Field::Select::Index::Component.new(field:, page: :index)
    end

    private

      def collection
        [
          ['Option 1', 'option1'],
          ['Option 2', 'option2']
        ]
      end

      def resource
        SampleModel.new(attribute_name: 'option1')
      end

      def form_obj
        Admin::FormBuilder.new(
          'sample', resource, SampleTemplate.new(:attribute_name), {}
        )
      end
  end
end
