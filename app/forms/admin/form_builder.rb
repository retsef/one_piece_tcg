class Admin::FormBuilder < ViewComponent::Form::Builder
  # Set the namespace you want to use for your own components
  namespace 'Admin::Form'

  def translation(method_name)
    content ||= ActionView::Helpers::Tags::Translator
                .new(object, @object_name, method_name, scope: 'helpers.label')
                .translate
    content || attribute_name.humanize
  end

  def inline_submit(value = nil, options = {})
    if value.is_a?(Hash)
      options = value
      value = nil
    end
    value ||= submit_default_value
    render_component(:inline_submit, value, options)
  end

  def honeypot(value = nil, options = {})
    render_component(:honeypot, value, options)
  end
end
