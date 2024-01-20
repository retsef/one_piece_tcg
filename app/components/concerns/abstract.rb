module Abstract
  extend ActiveSupport::Concern

  included do
    # @private
    def initialize(*)
      raise NotImplementedError, "#{self} is an abstract class and cannot be instantiated." if self.class.abstract_class?

      super
    end
  end

  class_methods do
    attr_accessor :abstract_class

    # Returns whether this class is an abstract class or not.
    def abstract_class?
      defined?(@abstract_class) && @abstract_class == true
    end

    def set_as_abstract_class
      self.abstract_class = true
    end
  end
end
