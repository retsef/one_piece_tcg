module Administrate::Field
  class BelongsToPreview < BasePreview
    def form
      field = Administrate::Field::BelongsTo.new(:attribute_name, SampleModel.new(id: 1), :form, resource:)
      render Administrate::Field::BelongsTo::Form::Component.new(field:, page: :form, form: form_obj)
    end

    def show
      field = Administrate::Field::BelongsTo.new(:attribute_name, SampleModel.new(id: 1), :show, resource:)
      render Administrate::Field::BelongsTo::Show::Component.new(field:, page: :show)
    end

    def index
      field = Administrate::Field::BelongsTo.new(:attribute_name, SampleModel.new(id: 1), :index, resource:)
      render Administrate::Field::BelongsTo::Index::Component.new(field:, page: :index)
    end

    private

      def resource
        SampleModel.new(attribute_name: 'id')
      end

      def form_obj
        Admin::FormBuilder.new(
          'sample', resource, SampleTemplate.new(:attribute_name), {}
        )
      end
  end
end
