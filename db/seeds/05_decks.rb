DECKS = {
  'ST01' => 'vendor/decks/st01.txt',
  'ST02' => 'vendor/decks/st02.txt',
  'ST03' => 'vendor/decks/st03.txt',
  'ST04' => 'vendor/decks/st04.txt',
  'ST05' => 'vendor/decks/st05.txt',
  'ST06' => 'vendor/decks/st06.txt',
  'ST07' => 'vendor/decks/st07.txt',
  'ST08' => 'vendor/decks/st08.txt',
  'ST09' => 'vendor/decks/st09.txt'
}

DECKS.each do |name, path|
  next if Deck.exists?(name:)

  file = Rails.root.join(path).open
  Deck::Importer.import(file, name:)
end
