class Administrate::Field::ActiveStorage < Administrate::Field::Base
  def self.eager_load?
    false
  end

  def self.associative?
    false
  end

  def associated_class_name
    "ActiveStorage::Attachment"
  end

  def index_display_preview?
    options.fetch(:index_display_preview, true)
  end

  def index_preview_options
    options.fetch(:index_preview_options, { resize_to_fill: [150, 150] })
  end

  def index_display_count?
    options.fetch(:index_display_count) { attached? && attachments.count != 1 }
  end

  def show_display_preview?
    options.fetch(:show_display_preview, true)
  end

  def show_preview_options
    options.fetch(:show_preview_options, { resize_to_fill: [800, 800] })
  end

  def many?
    data.is_a? ::ActiveStorage::Attached::Many
  end

  def direct?
    options.fetch(:direct_upload, false)
  end

  def destroy_url
    options.fetch(:destroy_url, nil)
  end

  # currently we are using Rails.application.routes.url_helpers
  # without including the namespace because it runs into an
  # exception

  # work around since calling data.preview(options)
  # returns "/images/<ActiveStorage::Preview>" which isnt the url
  def preview(attachment, options)
    url_helpers.rails_representation_path(attachment.preview(options), only_path: true)
  end

  def variant(attachment, options)
    url_helpers.rails_representation_path(attachment.variant(options), only_path: true)
  end

  def url(attachment)
    url_helpers.rails_blob_path(attachment, only_path: true)
  end

  def blob_url(attachment)
    url_helpers.rails_blob_path(attachment, disposition: :attachment, only_path: true)
  end

  def can_add_attachment?
    many? || attachments.blank?
  end

  def attached?
    data.present? && data.attached?
  end

  def attachments
    return data.attachments if many?
    return [data.attachment] if attached?

    []
  end

  def self.permitted_attribute(attr, options = {})
    permitted_attribute = attr.to_sym
    permitted_attribute = { permitted_attribute => [] } if options[:multiple]
    permitted_attribute
  end

  private

    def url_helpers
      Rails.application.routes.url_helpers
    end
end
