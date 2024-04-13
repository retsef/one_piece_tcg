class Administrate::Field::BasePreview < ViewComponent::Preview
  class SampleModel
    include ActiveModel::Model

    attr_accessor :attribute_name, :id

    def self.inheritance_column
      'type'
    end

    def self.inheritance_column?
      false
    end

    # Mimic ActiveRecord's `reflect_on_association` method
    def self.reflect_on_association(association)
      OpenStruct.new(name: association,
                     klass: SampleModel,
                     association_primary_key: 'id')
    end

    def self.all
      10.times.map { |i| new(id: i, attribute_name: 'id') }
    end
  end

  class SampleModelDashboard < ApplicationDashboard
    ATTRIBUTE_TYPES = {
      attribute_name: Field::String,
    }.freeze
    COLLECTION_ATTRIBUTES = %i[attribute_name].freeze
  end

  class SampleTemplate
    include ActiveModel::Model

    def initialize(attribute_name)
      @field_name = attribute_name
    end

    def lookup_context
      ActionView::LookupContext.new([])
    end

    def controller
      Lookbook::PreviewsController
    end

    def view_renderer
      nil
    end

    def view_flow
      nil
    end

    def field_name(_object, _method_name, **_args)
      @field_name
    end

    def field_id(_object, _method_name, **_args)
      'sample'
    end

    def hidden_field(object_name, method, options = {})
      ActionView::Helpers::Tags::HiddenField.new(object_name, method, self, options).render
    end
  end
end
