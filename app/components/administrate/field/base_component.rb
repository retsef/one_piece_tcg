class Administrate::Field::BaseComponent < ApplicationComponent
  include Administrate::Field::LookupContext
  attr_reader :field

  def initialize(field:, **options)
    super

    @field = field
  end

  delegate :resource_class, :resource_name, to: :field
  delegate :render_field, :namespace, to: :helpers
  delegate :authorized_action?, :accessible_action?, to: :helpers

  protected

    def link_to_if(condition, name, options = {}, html_options = {}, &block)
      if condition
        name = name.call if name.is_a?(Proc)
        return link_to(name, options, html_options, &block)
      end

      if block
        return block.arity <= 1 ? capture(name, &block) : capture(name, options, html_options, &block)
      end

      ERB::Util.html_escape(name)
    end
end
