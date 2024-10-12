module Administrate
  module Field
    class Deferred
      def initialize(deferred_class, options = {})
        @deferred_class = deferred_class
        @options = options
      end

      attr_reader :deferred_class, :options

      def new(*args)
        new_options = args.last.respond_to?(:merge) ? args.pop : {}
        deferred_class.new(*args, options.merge(new_options))
      end

      def ==(other)
        other.respond_to?(:deferred_class) &&
          deferred_class == other.deferred_class &&
          options == other.options
      end

      delegate :associative?, to: :deferred_class

      delegate :eager_load?, to: :deferred_class

      def searchable?
        options.fetch(:searchable, deferred_class.searchable?)
      end

      def searchable_field
        ActiveSupport::Deprecation.warn('searchable_field is deprecated, use searchable_fields instead')
        options.fetch(:searchable_field)
      end

      def searchable_fields
        if options.key?(:searchable_field)
          [ searchable_field ]
        else
          options.fetch(:searchable_fields)
        end
      end

      def editable_inline?
        options.fetch(:editable_inline, deferred_class.editable_inline?)
      end

      def permitted_attribute(attr, opts = {})
        if options.key?(:foreign_key)
          Administrate.warn_of_deprecated_option(:foreign_key)
          options.fetch(:foreign_key)
        else
          deferred_class.permitted_attribute(attr, options.merge(opts))
        end
      end

      delegate :html_class, to: :deferred_class
    end
  end
end
