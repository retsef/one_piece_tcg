class Admin::MenuItem
  include ActiveModel::Model
  include ActiveLinkToHelper

  DEFAULT_URL = '#'.freeze

  attr_reader :label, :icon, :resource_class, :position, :children, :beta, :coming_soon, :data_attributes

  def initialize(label: '', icon: nil, url: nil, **args)
    @label = label
    @icon = icon
    @url = url
    @active_matcher = args[:active_matcher] || :inclusive

    resource_class = args[:resource_class]
    @resource_class = resource_class.is_a?(String) ? resource_class.constantize : resource_class

    @beta = args[:beta] || false
    @coming_soon = args[:coming_soon] || false

    @position = args[:position] || 0
    @children = []

    @data_attributes = args[:data] || {}
  end

  alias_method :beta?, :beta
  alias_method :coming_soon?, :coming_soon

  def ordered_children
    children.sort_by(&:position)
  end

  def children?
    children.present?
  end

  def append(child)
    child.position = children.size
    @children << child
  end

  def label?
    label.present?
  end

  def icon?
    icon.present?
  end

  def urls
    urls = []
    urls << url if url.present? && url != '#'
    urls += children.map(&:urls).flatten
    urls.compact
  end

  def resource_url
    return nil unless @resource_class

    url_helpers.polymorphic_path([ namespace, @resource_class ])
  end

  def url
    return DEFAULT_URL if @url.blank? && @resource_class.blank?
    return resource_url if @resource_class.present? && @url.blank?

    case @url
    when NilClass then resource_url if @resource_class.present?
    when Symbol   then url_helpers.send(@url) if url_helpers.respond_to?(@url)
    when String   then @url if @url.start_with?(/http|https/)
    when Proc     then @url.call
    when Array    then url_helpers.polymorphic_path(@url)
    else               @url
    end || DEFAULT_URL
  end

  def active_matcher
    return false if url == DEFAULT_URL
    return false if url&.start_with?(/http|https/)

    @active_matcher
  end

  def unreachable_url?
    return false if @url.blank? || url_helpers.respond_to?(@url) || resource_url

    true
  end

  def external?
    url&.start_with?(/http|https/)
  end

  private

    def namespace
      :admin
    end

    def url_helpers
      Rails.application.routes.url_helpers
    end
end
