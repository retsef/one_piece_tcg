require 'open-uri'

class Card::ArtworkImageJob < ApplicationJob
  queue_as :default

  PERMIT_IMAGE_FORMAT = %w[png jpg jpeg].freeze

  def perform(artwork, image_url)
    valid_image_format = get_content_type(image_url)
    raise 'Invalid image' unless valid_image_format

    image_name = File.basename(image_url)
    image_io = URI.open(image_url) # rubocop:disable Security/Open
    artwork.image.attach(io: image_io, filename: image_name, content_type: valid_image_format)
  end

  private

    def get_content_type(image_url)
      ext_name = File.extname(image_url).delete('.')
      return unless PERMIT_IMAGE_FORMAT.include?(ext_name)

      "image/#{ext_name}"
    end
end
