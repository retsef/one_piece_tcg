module Arena
  class HandCard::Component < BaseComponent
    attr_accessor :card, :artwork, :rotation, :offset

    def initialize(card, artwork = nil, rotation: 0, offset: 0)
      super

      @card = card
      @artwork = artwork || card.artworks.first

      @rotation = rotation
      @offset = offset
    end

    delegate :name, :code, to: :card, prefix: true

    def image_url
      url_for(artwork.image)
    end
  end
end
