module Searchable
  extend ActiveSupport::Concern

  included do
    class_attribute :allowed_ransackable_associations, default: []
    class_attribute :allowed_ransackable_attributes, default: []
    class_attribute :allowed_ransackable_scopes, default: []
    class_attribute :default_ransackable_attributes
    self.default_ransackable_attributes = %w[id]
  end

  class_methods do
    def ransackable_associations(*_args)
      allowed_ransackable_associations
    end

    def ransackable_attributes(*_args)
      default_ransackable_attributes | allowed_ransackable_attributes
    end

    def ransackable_scopes(*_args)
      allowed_ransackable_scopes
    end

    def searchable_by(*attributes)
      self.allowed_ransackable_attributes += attributes.map(&:to_s)
    end

    def searchable_along(*associations)
      self.allowed_ransackable_associations += associations.map(&:to_s)
      self.allowed_ransackable_attributes += associations.filter_map do |assoc|
        reflection = reflections[assoc.to_s]

        next unless reflection&.belongs_to?

        reflection.foreign_key
      end
    end

    def searchable_scopes(*scopes)
      self.allowed_ransackable_scopes += scopes.map(&:to_sym)
    end

    def define_searchable_field(field_name, &block)
      ransacker(field_name, &block)
    end
  end
end
