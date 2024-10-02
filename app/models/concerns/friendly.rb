# Extracted from https://github.com/norman/friendly_id/blob/master/lib/friendly_id/finders.rb
module Friendly
  extend ActiveSupport::Concern

  included do
    cattr_accessor :friendly_query_field, default: :id

    def to_param
      send(self.class.friendly_query_field)
    end
  end

  class_methods do
    def friendly_id(field)
      self.friendly_query_field = field
    end

    def find(*args)
      all.find(*args)
    end

    # Extend scoped to allow friendly finds.
    def all
      super.extending(FinderMethods)
    end

    def default_scoped(scope = relation, all_queries: nil)
      super(scope, all_queries:).extending(FinderMethods)
    end

    def setup(model_class)
      model_class.instance_eval do
        relation.class.send(:include, FinderMethods)

        model_class.send(:extend, FinderMethods)
      end

      # Support for friendly finds on associations for Rails 4.0.1 and above.
      if ::ActiveRecord.const_defined?('AssociationRelation')
        model_class.include(Friendly)
        association_relation_delegate_class = model_class.relation_delegate_class(::ActiveRecord::AssociationRelation)
        association_relation_delegate_class.send(:include, FinderMethods)
      end
    end
  end

  module FinderMethods
    # Finds a record using the given id.
    #
    # If the id is "unfriendly", it will call the original find method.
    # If the id is a numeric string like '123' it will first look for a friendly
    # id matching '123' and then fall back to looking for a record with the
    # numeric id '123'.
    #
    # @param [Boolean] allow_nil (default: false)
    # Use allow_nil: true if you'd like the finder to return nil instead of
    # raising ActivRecord::RecordNotFound
    #
    # ### Example
    #
    #     MyModel.friendly.find("bad-slug")
    #     #=> raise ActiveRecord::RecordNotFound
    #
    #     MyModel.friendly.find("bad-slug", allow_nil: true)
    #     #=> nil
    #
    # Since FriendlyId 5.0, if the id is a nonnumeric string like '123-foo' it
    # will *only* search by friendly id and not fall back to the regular find
    # method.
    #
    # If you want to search only by the friendly id, use {#find_by_friendly_id}.
    # @raise ActiveRecord::RecordNotFound
    def find(*args, allow_nil: false)
      id = args.first
      return super(*args) if args.count != 1 || !friendly_id?(id)

      resource = find_by(friendly_query_field => id)
      return resource if resource

      return super(*args) if potential_primary_key?(id)

      raise_not_found_exception(id) unless allow_nil
    rescue ActiveRecord::RecordNotFound => exception
      raise exception unless allow_nil
    end

    def raise_not_found_exception(id)
      raise ActiveRecord::RecordNotFound.new("Can't find record with friendly id: #{id.inspect}", name, friendly_query_field, id)
    end

    # True if the id is definitely friendly, false if definitely unfriendly,
    # else nil.
    #
    # An object is considired "definitely unfriendly" if its class is or
    # inherits from ActiveRecord::Base, Array, Hash, NilClass, Numeric, or
    # Symbol.
    #
    # An object is considered "definitely friendly" if it responds to +to_i+,
    # and its value when cast to an integer and then back to a string is
    # different from its value when merely cast to a string:
    #
    #     123.friendly_id?                  #=> false
    #     :id.friendly_id?                  #=> false
    #     {:name => 'joe'}.friendly_id?     #=> false
    #     ['name = ?', 'joe'].friendly_id?  #=> false
    #     nil.friendly_id?                  #=> false
    #     "123".friendly_id?                #=> nil
    #     "abc123".friendly_id?             #=> true
    def friendly_id?(value)
      value.respond_to?(:to_i) && value.to_i.to_s != value.to_s
    end

    UUID_RULE = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/.freeze
    def potential_primary_key?(id)
      key_type = primary_key_type
      # Hook for "ActiveModel::Type::Integer" instance.
      key_type = key_type.type if key_type.respond_to?(:type)
      case key_type
      when :integer then Integer(id, 10)
      when :uuid then id.match(UUID_RULE)
      else true
      end
    rescue
      false
    end
  end
end
