class Admin::Actions::Group::Component < ApplicationComponent
  renders_many :items, Admin::Actions::Item::Component

  def first_item(style = {})
    items.first.tap { |item| item.variant_style.merge!(style) }
  end

  def outer_items
    items.drop(1)
  end

  def outer_items?
    items.size > 1
  end

  def render?
    items.any?
  end
end
