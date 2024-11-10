module Admin::Navigation::Mobile
  class MenuEntry::Component < BaseComponent
    include ActiveLinkToHelper

    attr_accessor :menu_item

    def initialize(menu_item:)
      super

      @menu_item = menu_item
    end

    delegate :label, :icon, :url, :active_matcher, :position, :resource_class, :data_attributes,
             :label?, :icon?, :beta?, :coming_soon?, :external?, to: :menu_item

    def render?
      return true unless resource_class

      allowed_to?(:index?, resource_class) || allowed_to?(:manage?, resource_class)
    end
  end
end
