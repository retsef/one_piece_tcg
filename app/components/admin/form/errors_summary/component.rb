class Admin::Form::ErrorsSummary::Component < ApplicationComponent
  attr_reader :resource

  def initialize(resource:)
    super

    @resource = resource
  end

  def resource_name
    resource.model_name.human(count: 1)
  end

  def messages
    resource.errors.full_messages
  end

  def errors_count
    resource.errors.count
  end

  def render?
    return false unless resource

    resource.errors.any?
  end
end
