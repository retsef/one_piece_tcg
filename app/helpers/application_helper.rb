module ApplicationHelper
  PLURAL_MANY_COUNT = 2.1
  SINGULAR_COUNT = 1

  def application_title
    # Rails.application.class.module_parent_name.titlecase
    I18n.t('app.name')
  end

  def application_description
    application_title
  end

  def sort_order(order)
    case order
    when 'asc' then I18n.t('order.asc')
    when 'desc' then I18n.t('order.desc')
    else I18n.t('order.none')
    end
  end

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

  def try_polymorphic_path(args)
    polymorphic_path(args) rescue '#'
  end

  # TODO: move to view_component
  # Returns just the initials.
  def initials(name, limit_chars = 2)
    name.remove(/(\(|\[).*(\)|\])/)
        .scan(/([[:word:]])[[:word:]]+/i)
        .flatten.select { |p| p.match(/\p{Upper}/) }
        .slice(0...limit_chars).join
  end

  def clear_search_params
    params.except(:search, :_page).permit(
      :per_page, resource_name => %i[order direction]
    )
  end
end
