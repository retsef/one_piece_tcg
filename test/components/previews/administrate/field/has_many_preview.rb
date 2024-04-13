module Administrate::Field
  class HasManyPreview < BasePreview
    def form
      field = Administrate::Field::HasMany.new(:attribute_name, data, :form, resource:)
      render Administrate::Field::HasMany::Form::Component.new(field:, page: :form, form: form_obj)
    end

    def show
      field = Administrate::Field::HasMany.new(:attribute_name, data, :show, resource:)
      render Administrate::Field::HasMany::Show::Component.new(field:, page: :show)
    end

    def index
      field = Administrate::Field::HasMany.new(:attribute_name, data, :index, resource:)
      render Administrate::Field::HasMany::Index::Component.new(field:, page: :index)
    end

    private
      def resource
        SampleModel.new(attribute_name: 'id')
      end

      def data
        array = [
          SampleModel.new(id: 1),
          SampleModel.new(id: 2)
        ]

        OpenStruct.new(
          all: array,
          to_a: array,
          klass: SampleModel
        ).tap do |struct|
          struct.define_singleton_method(:count) { |method = :all| array.size }
          struct.define_singleton_method(:none) { [] }

          struct.define_singleton_method(:offset) { |offset| self }
          struct.define_singleton_method(:limit) { |limit| self }

          struct.define_singleton_method(:map) { |&block| array.map(&block) }
          struct.define_singleton_method(:each) { |&block| array.each(&block) }
          # struct.delegate :map, to: array
          # struct.delegate :each, to: array
        end
      end

      def form_obj
        Admin::FormBuilder.new(
          'sample', resource, SampleTemplate.new(:attribute_name), {}
        )
      end
  end
end
