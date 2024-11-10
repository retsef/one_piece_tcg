module Administrate::Field
  class EmailPreview < BasePreview
    def form
      field = Administrate::Field::Email.new(:attribute_name, 'sample', :form, resource:)
      render Administrate::Field::Email::Form::Component.new(field:, page: :form, form: form_obj)
    end

    def show
      field = Administrate::Field::Email.new(:attribute_name, 'sample', :show, resource:)
      render Administrate::Field::Email::Show::Component.new(field:, page: :show)
    end

    def index
      field = Administrate::Field::Email.new(:attribute_name, 'sample', :index, resource:)
      render Administrate::Field::Email::Index::Component.new(field:, page: :index)
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
