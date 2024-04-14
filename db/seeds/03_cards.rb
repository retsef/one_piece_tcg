require 'nokogiri'
require 'open-uri'
require 'net/http'

PRODUCER_URL = 'https://en.onepiece-cardgame.com'

# Fetch all card description directly from official website
Card.transaction do
  Card::SERIES.each do |code, series|
    puts "Importing #{series[:name]} series..."

    uri = URI.parse("#{PRODUCER_URL}/cardlist/?series=#{series[:id]}")

    http = Net::HTTP.new(uri.host, uri.port).tap { |http| http.use_ssl = true }
    response = http.get(uri.request_uri, {
      'User-Agent' => 'Mozilla/5.0',
      'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
      'Accept-Language' => 'en-us',
      'Host' => uri.host,
    })

    html = response.body
    doc = Nokogiri::HTML(html)

    puts "Found #{doc.css('.resultCol .modalCol').count} cards"

    doc.css('.resultCol .modalCol').each do |card|
      code, rarity_code, type = card.css('.infoCol').text.split('|').collect(&:strip)

      name = card.css('.cardName').text
      image_url = card.css('.frontCol img').attribute('src').text.gsub('..', PRODUCER_URL).split('?').first

      cost = card.css('.cost').text.remove('Life', 'Cost').to_i
      elements = card.css('.attribute').text.remove('Attribute').strip.split(' ')
      power = card.css('.power').text.remove('Power').to_i
      counter = card.css('.counter').text.remove('Counter').to_i
      colors = card.css('.color').text.remove('Color').split('/')
      features = card.css('.feature').text.remove('Type').split('/')

      effect = card.css('.text').text.remove('Effect')
      trigger = card.css('.trigger').text.remove('Trigger[Trigger] ')

      # There is cards with same code but different rarity due to the artwork
      if Card.exists?(code: code)
        card = Card.find_by(code: code)

        rarity = case rarity_code
                 when 'SP CARD' then :special_rare
                 when 'TR' then :treasure_rare
                 else :alternative
                 end

        card.artworks.create!(rarity: rarity).attach_image(image_url)

        next
      end
      next if ['SP CARD', 'TR'].include? rarity_code # Skip special rare and treasure rare cards

      Card.create!(
        type: type.downcase.camelcase,
        rarity: rarity_code,

        code: code,
        name: name,
        cost: cost,
        power: power,
        counter: counter,
        colors: colors.collect(&:downcase),
        elements: elements.collect(&:downcase),
        families: features.collect { |family| Family.find_or_create_by(name: family) },

        effect: effect,
        trigger: trigger,
      ).artworks.create!.attach_image(image_url)
    end

    puts "Imported #{series[:name]} series"
  end
end
