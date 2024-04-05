require 'nokogiri'
require 'open-uri'
require 'net/http'

# Cards
SERIES = {
  '569201': "EXTRA BOOSTER -MEMORIAL COLLECTION- [EB-01]",
  '569106': "BOOSTER PACK -WINGS OF THE CAPTAIN- [OP-06]",
  '569105': "BOOSTER PACK -AWAKENING OF THE NEW ERA- [OP-05]",
  '569104': "BOOSTER PACK -KINGDOMS OF INTRIGUE- [OP-04]",
  '569103': "BOOSTER PACK -PILLARS OF STRENGTH- [OP-03]",
  '569102': "BOOSTER PACK -PARAMOUNT WAR- [OP-02]",
  '569101': "BOOSTER PACK -ROMANCE DAWN- [OP-01]",
  '569013': "ULTRA DECK -The Three Brothers- [ST-13]",
  '569012': "STARTER DECK -Zoro and Sanji- [ST-12]",
  '569011': "STARTER DECK -Uta- [ST-11]",
  '569010': "ULTRA DECK -The Three Captains- [ST-10]",
  '569009': "STARTER DECK -Yamato- [ST-09]",
  '569008': "STARTER DECK -Monkey D. Luffy- [ST-08]",
  '569007': "STARTER DECK -Big Mom Pirates- [ST-07]",
  '569006': "STARTER DECK -Absolute Justice- [ST-06]",
  '569005': "STARTER DECK -ONE PIECE FILM edition- [ST-05]",
  '569004': "STARTER DECK -Animal Kingdom Pirates- [ST-04]",
  '569003': "STARTER DECK -The Seven Warlords of the Sea- [ST-03]",
  '569002': "STARTER DECK -Worst Generation- [ST-02]",
  '569001': "STARTER DECK -Straw Hat Crew- [ST-01]",
  '569901': "Promotion card",
  # '569801': "Limited Product Card",
}

# Fetch all card description directly from official website
SERIES.each do |code, serie_name|
  puts "Importing #{serie_name} series..."

  uri = URI.parse("https://en.onepiece-cardgame.com/cardlist/?series=#{code}")

  http = Net::HTTP.new(uri.host, uri.port).tap { |http| http.use_ssl = true }
  response = http.get(uri.request_uri, {
    'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Safari/605.1.15',
    'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
    'Accept-Language' => 'en-us',
    'Host' => 'en.onepiece-cardgame.com',
  })

  html = response.body
  doc = Nokogiri::HTML(html)

  puts "Found #{doc.css('.resultCol .modalCol').count} cards"

  doc.css('.resultCol .modalCol').each do |card|
    code, rarity_code, type = card.css('.infoCol').text.split('|').collect(&:strip)

    name = card.css('.cardName').text

    cost = card.css('.cost').text.remove('Life', 'Cost').to_i
    elements = card.css('.attribute').text.remove('Attribute').strip.split(' ')
    power = card.css('.power').text.remove('Power').to_i
    counter = card.css('.counter').text.remove('Counter').to_i
    colors = card.css('.color').text.remove('Color').split('/')
    features = card.css('.feature').text.remove('Type').split('/')

    effect = card.css('.text').text.remove('Effect')
    trigger = card.css('.trigger').text.remove('Trigger')

    # There is cards with same code but different rarity due to the artwork
    next if Card.exists?(code: code)
    next if ['SP CARD', 'TR'].include? rarity_code

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
      )
  end

  puts "Imported #{serie_name} series"
end
