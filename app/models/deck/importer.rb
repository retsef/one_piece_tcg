class Deck::Importer
  def self.import(file, name: nil)
    plain_text = file.read

    Deck.transaction do
      deck = Deck.create(name: name || file.original_filename)
      plain_text.split.each do |row|
        count, code = row.split('x')
        card = Card.find_by(code: code)
        next unless card

        if card.leader?
          deck.update(leader: card)
          next
        end

        count.to_i.times do
          deck.cards << card
        end
      end
    end
  end
end
