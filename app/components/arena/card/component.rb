module Arena
  class Card::Component < BaseComponent
    attr_accessor :card, :artwork

    def initialize(card, artwork = nil)
      super

      @card = card
      @artwork = artwork || card&.artworks&.first
    end

    delegate :name, :code, :cost, :power, :counter, :type, :color,
             to: :card, prefix: true

    def image_url
      url_for(artwork.image) rescue nil
    end

    def render?
      card.present?
    end
  end
end
