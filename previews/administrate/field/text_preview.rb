module Administrate::Field
  class TextPreview < BasePreview
    def form
      field = Administrate::Field::Text.new(:attribute_name, 'sample', :form, resource:)
      render Administrate::Field::Text::Form::Component.new(field:, page: :form, form: form_obj)
    end

    def show
      field = Administrate::Field::Text.new(:attribute_name, 'sample', :show, resource:)
      render Administrate::Field::Text::Show::Component.new(field:, page: :show)
    end

    def index
      field = Administrate::Field::Text.new(:attribute_name, 'sample', :index, resource:)
      render Administrate::Field::Text::Index::Component.new(field:, page: :index)
    end

    private

      def resource
        SampleModel.new(attribute_name: 'Hello')
      end

      def form_obj
        Admin::FormBuilder.new(
          'sample', resource, SampleTemplate.new(:attribute_name), {}
        )
      end
  end
end
